using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Xml;

namespace WebserviceSimulation
{
    public class IISHandler1 : IHttpHandler
    {
        /// <summary>
        /// You will need to configure this handler in the Web.config file of your 
        /// web and register it with IIS before being able to use it. For more information
        /// see the following link: http://go.microsoft.com/?linkid=8101007
        /// </summary>
        #region IHttpHandler Members

        public bool IsReusable
        {
            // Return false in case your Managed Handler cannot be reused for another request.
            // Usually this would be false in case you have some state information preserved per request.
            get { return true; }
        }

        public void ProcessRequest(HttpContext context)
        {

            HttpRequest r = context.Request;


            //Verificar se é webservice simulation ou gateway de sms
            if (r.FilePath.Contains("smssimula"))
            {
                //SMS
                string from = r.Params.Get("from");
                string to = r.Params.Get("to");
                string message = r.Params.Get("text");


                string connection = System.Configuration.ConfigurationManager.ConnectionStrings["WebserviceSimulationConnectionString"].ConnectionString;

                using (SqlConnection sqlConnection1 = new SqlConnection(connection))
                {
                    SqlCommand cmd = new SqlCommand();
                    SqlDataReader reader;

                    cmd.CommandText = "usp_saveSMSSimulation";
                    cmd.CommandType = CommandType.StoredProcedure;


                    SqlParameter parameter = new SqlParameter();
                    parameter.ParameterName = "@smsFrom";
                    parameter.SqlDbType = SqlDbType.NVarChar;
                    parameter.Direction = ParameterDirection.Input;
                    parameter.Value = from;

                    cmd.Parameters.Add(parameter);

                    SqlParameter parameter1 = new SqlParameter();
                    parameter1.ParameterName = "@smsTo";
                    parameter1.SqlDbType = SqlDbType.NVarChar;
                    parameter1.Direction = ParameterDirection.Input;
                    parameter1.Value = to;

                    cmd.Parameters.Add(parameter1);


                    SqlParameter parameter2 = new SqlParameter();
                    parameter2.ParameterName = "@message1";
                    parameter2.SqlDbType = SqlDbType.NVarChar;
                    parameter2.Direction = ParameterDirection.Input;
                    parameter2.Value = message;

                    cmd.Parameters.Add(parameter2);

                    cmd.Connection = sqlConnection1;

                    sqlConnection1.Open();

                    cmd.ExecuteNonQuery();



                    context.Response.Write("--OK Simulacao");


                }

            }
            else
            {
                //webservice




                XmlDocument xm = new XmlDocument();


                String contentType = r.ContentType;
                string[] arrcontent = contentType.Split(';');

                String action = "";

                foreach (String s in arrcontent)
                {
                    if (s.Contains("action="))
                    {
                        action = s.Split('=')[1].Replace("\"", "");
                    }
                }

                System.IO.StreamReader sreader = new System.IO.StreamReader(HttpContext.Current.Request.InputStream);
                string requestFromPost = sreader.ReadToEnd();
                XmlDocument x = new XmlDocument();
                x.LoadXml(requestFromPost);


                string request2 = x.InnerXml;

                string connection = System.Configuration.ConfigurationManager.ConnectionStrings["WebserviceSimulationConnectionString"].ConnectionString;

                using (SqlConnection sqlConnection1 = new SqlConnection(connection))
                {
                    SqlCommand cmd = new SqlCommand();
                    SqlDataReader reader;

                    cmd.CommandText = "usp_getSimulation";
                    cmd.CommandType = CommandType.StoredProcedure;


                    SqlParameter parameter = new SqlParameter();
                    parameter.ParameterName = "@action";
                    parameter.SqlDbType = SqlDbType.NVarChar;
                    parameter.Direction = ParameterDirection.Input;
                    parameter.Value = action;

                    cmd.Parameters.Add(parameter);

                    SqlParameter parameter1 = new SqlParameter();
                    parameter1.ParameterName = "@input";
                    parameter1.SqlDbType = SqlDbType.NVarChar;
                    parameter1.Direction = ParameterDirection.Input;
                    parameter1.Value = request2;

                    cmd.Parameters.Add(parameter1);

                    cmd.Connection = sqlConnection1;

                    sqlConnection1.Open();

                    reader = cmd.ExecuteReader();
                    // Data is accessible through the DataReader object here.

                    reader.Read();


                    context.Response.Write(reader.GetString(0));
                    context.Response.ContentType = "application/soap+xml";


                }
            }

        }

        #endregion
    }
}
