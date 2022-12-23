using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace RoozbehExtension.BL
{
    public class StatisticsBL
    {
        public static double[] GetPersentStatistics(out string[] calculaionTypeTitles)
        {
            //select COUNT(*) from tbl_licences times where YEAR(InsertDate) = YEAR(getdate()) and (MONTH(InsertDate) = MONTH(getdate()) or (MONTH(InsertDate)) = (MONTH(getdate()) - 1))  and day(InsertDate) = day(getdate() - @i)
            string sqlcmd;
            string firstSqlcmd = "select COUNT(*) from jdPolls";
            string getPollTypeCountSql = "select COUNT(*) from jdPollTypes";
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbRoozbehExtensionConnectionString"].ToString());
            con.Open();
            sqlcmd = "SELECT Count(*),Title FROM jdPollTypes INNER JOIN jdPolls on jdPollTypes.Id = jdPolls.PollTypeRef GROUP BY Title";
            int Countall = 0;
            //sqlcmd = "select count(*) from tbl_LicenceUtilization GROUP BY CalculationTypeRef";
            SqlCommand cmd = new SqlCommand(firstSqlcmd, con);
            using (SqlDataReader r = cmd.ExecuteReader())
            {
                if (r.Read())
                {
                    Countall = System.Convert.ToInt32(r.GetValue(0).ToString());
                }
            }
            cmd = new SqlCommand(getPollTypeCountSql, con);
            int PollTypeCount=0;
            using (SqlDataReader r = cmd.ExecuteReader())
            {
                if (r.Read())
                {
                    PollTypeCount = System.Convert.ToInt32(r.GetValue(0).ToString());
                }
            }
            SqlCommand cmd2 = new SqlCommand(sqlcmd, con);
            calculaionTypeTitles = new string[PollTypeCount];
            double[] statistics = new double[PollTypeCount];
            using (SqlDataReader r2 = cmd2.ExecuteReader())
            {
                int i = 0;
                while (r2.Read())
                {
                    statistics[i] = (double.Parse(r2.GetValue(0).ToString()) / Countall)*100;
                    calculaionTypeTitles[i] = r2.GetValue(1).ToString();
                    i++;
                }
            }
            con.Close();
            return statistics;
        }

        public static double[] GetStatistics(int questionId, out string[] answerChoiceTitles)
        {
            //select COUNT(*) from tbl_licences times where YEAR(InsertDate) = YEAR(getdate()) and (MONTH(InsertDate) = MONTH(getdate()) or (MONTH(InsertDate)) = (MONTH(getdate()) - 1))  and day(InsertDate) = day(getdate() - @i)
            string sqlcmd;
            string firstSqlcmd = "select COUNT(id) from jPollQuestionChoices where PollQuestionRef = '"+questionId+"'";
            string getPollTypeCountSql = "SELECT     COUNT(jPollQuestionAnswers.Id) AS pollCount FROM         jPollQuestionAnswers INNER JOIN jPollQuestionChoices ON jPollQuestionAnswers.PollQuestionChoiceRef = jPollQuestionChoices.Id where      (jPollQuestionChoices.PollQuestionRef = '"+questionId+"')";
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbRoozbehExtensionConnectionString"].ToString());
            con.Open();
            sqlcmd = "SELECT     COUNT( jPollQuestionAnswers.Id), jPollQuestionChoices.Title FROM         jPollQuestionAnswers INNER JOIN        jPollQuestionChoices ON jPollQuestionAnswers.PollQuestionChoiceRef = jPollQuestionChoices.Id WHERE     (jPollQuestionChoices.Status = 'Active') AND (jPollQuestionChoices.PollQuestionRef = '" + questionId + "') GROUP BY jPollQuestionChoices.Title";
            int Countall = 0;
            //sqlcmd = "select count(*) from tbl_LicenceUtilization GROUP BY CalculationTypeRef";
            SqlCommand cmd = new SqlCommand(firstSqlcmd, con);
            using (SqlDataReader r = cmd.ExecuteReader())
            {
                if (r.Read())
                {
                    Countall = System.Convert.ToInt32(r.GetValue(0).ToString());
                }
            }
            cmd = new SqlCommand(getPollTypeCountSql, con);
            int PollTypeCount = 0;
            using (SqlDataReader r = cmd.ExecuteReader())
            {
                if (r.Read())
                {
                    PollTypeCount = System.Convert.ToInt32(r.GetValue(0).ToString());
                }
            }
            SqlCommand cmd2 = new SqlCommand(sqlcmd, con);
            answerChoiceTitles = new string[Countall];
            double[] statistics = new double[Countall];
            using (SqlDataReader r2 = cmd2.ExecuteReader())
            {
                int i = 0;
                while (r2.Read())
                {
                    statistics[i] = (double.Parse(r2.GetValue(0).ToString()) / Countall) * 100;
                    answerChoiceTitles[i] = r2.GetValue(1).ToString();
                    i++;
                }
            }
            con.Close();
            return statistics;
        }
    }
}