//> using dep io.circe::circe-core:0.14.6
//> using dep io.circe::circe-generic:0.14.6
//> using dep io.circe::circe-parser:0.14.6
//> using option -Wunused:all

import java.io.FileWriter
import scala.io.Source
import io.circe.*
import io.circe.generic.auto.*
import io.circe.parser.*

case class Data(months: List[Month], extras: List[String])
case class Month(month: Int, name: String, days: List[Day])
case class Day(day: Int, name: String, prefixedName: String)

trait CalDay
case class RegularDay(month: String, day: Int,flavour: String) extends CalDay
case class ExtraDay(name: String) extends CalDay

object CalDay:
  extension (d: CalDay)
    def out(index: Int): String = d match
      case RegularDay(month, day, flavour) =>
        val formattedDay = if day == 1 then "1er" else day.toString
        s"  [$index] = { [\"month\"] = \"$month\", [\"day\"] = \"$formattedDay\", [\"flavour\"] = \"$flavour\" }"
      case ExtraDay(name) => s"  [$index] = { [\"name\"] = \"$name\" }"

def process(data: Data): Unit =
  val days = for
    m <- data.months.sortWith(_.month < _.month)
    d <- m.days.sortWith(_.day < _.day)
  yield RegularDay(m.name, d.day, d.prefixedName)
  val lines = (days ++ data.extras.map(ExtraDay(_))).zipWithIndex.map:
    case (d, i) => d.out(i + 1)
  val output = lines.mkString("local _, ns = ...\nns.calMap = {\n", ",\n", "\n}")
  val writer = new FileWriter("CalChnip/CalChnipData.lua")
  writer.write(output)
  writer.close()

object GenerateData extends App:

  val rawData =
    Source
      .fromFile("resources/data.json")
      .getLines
      .mkString

  decode[Data](rawData) match
    case Right(data) => process(data)
    case Left(e) => println(e)
