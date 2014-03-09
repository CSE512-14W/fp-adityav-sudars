using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;
using System.Data.SqlClient;

namespace DatabaseIVRHierarchies
{
    public class DatabaseFunctions
    {
        private String connectionString;

        private String sSource = "DatabaseFunctions";
        private String sLog = "Application";

        public DatabaseFunctions()
        {
            //AppDomain.CurrentDomain.SetData("DataDirectory", Environment.GetFolderPath(Environment.SpecialFolder.CommonApplicationData));
            //connectionString = "Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\IVRDatabase.mdf;Integrated Security=True;User Instance=True";

            // AppDomain.CurrentDomain.SetData("DataDirectory", Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments) + "\\Visual Studio 2010\\Projects\\IVR2.0\\DatabaseLayer");
            // connectionString = "Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\IVRDatabase.mdf;Integrated Security=True;User Instance=True";

            //connectionString = "Data Source=192.168.1.5,1433\\SQLEXPRESS; Initial Catalog = TalenthuntDB; User Id = ivrjunction; Password = Ivrjunction1";
            //connectionString = "Data Source=.\\SQLEXPRESS;AttachDbFilename=C:\\Users\\t-avash\\Documents\\Visual Studio 2010\\Projects\\TalentHunt_v3\\DatabaseTalentHunt\\TalentHuntDB.mdf;Integrated Security=True;User Instance=True;";
            //connectionString = "Data Source=192.168.1.5,1433\\SQLEXPRESS; Initial Catalog = TalentHuntCGNetDB; User Id = ivrjunction; Password = Ivrjunction1";

            connectionString = "Data Source=ADITYAV; Initial Catalog = IVRHierarchiesDB; Integrated Security=True;Pooling=False";
            
            if (!EventLog.SourceExists(sSource))
                EventLog.CreateEventSource(sSource, sLog);
            EventLog.WriteEntry(sSource, "Constructor Started");

        }

        public bool addAnalytics(String sessionId, String callerId, String pageName, String action, String identifier)
        {
            SqlConnection sqlConnection = null;

            bool isAdditionSuccess = false;
            try
            {
                using (sqlConnection = new SqlConnection(connectionString))
                {
                    sqlConnection.Open();
                    using (SqlCommand sqlCommand = new SqlCommand())
                    {
                        sqlCommand.CommandType = System.Data.CommandType.Text;


                        sqlCommand.CommandText = "INSERT INTO Analytics VALUES (@SessionId, @CallerId, @TimeStamp, @Page, @Action, @Identifier)";
                        sqlCommand.Connection = sqlConnection;

                        SqlParameter sessionIdParameter = new SqlParameter("@SessionId", System.Data.SqlDbType.NVarChar, 50);
                        sessionIdParameter.Value = sessionId;
                        sqlCommand.Parameters.Add(sessionIdParameter);

                        SqlParameter callerIdParameter = new SqlParameter("@CallerId", System.Data.SqlDbType.NVarChar, 50);
                        if (callerId == null)
                            callerIdParameter.Value = "NOT DETECTED";
                        else
                            callerIdParameter.Value = callerId;
                        sqlCommand.Parameters.Add(callerIdParameter);

                        SqlParameter systemDateParameter = new SqlParameter("@TimeStamp", System.Data.SqlDbType.DateTime);
                        systemDateParameter.Value = System.DateTime.Now;
                        sqlCommand.Parameters.Add(systemDateParameter);

                        SqlParameter pageParameter = new SqlParameter("@Page", System.Data.SqlDbType.NVarChar, 50);
                        pageParameter.Value = pageName;
                        sqlCommand.Parameters.Add(pageParameter);

                        SqlParameter actionParameter = new SqlParameter("@Action", System.Data.SqlDbType.NVarChar);
                        actionParameter.Value = action;
                        sqlCommand.Parameters.Add(actionParameter);

                        SqlParameter identifierParameter = new SqlParameter("@Identifier", System.Data.SqlDbType.NVarChar);
                        if (identifier == null)
                            identifierParameter.Value = DBNull.Value;
                        else
                            identifierParameter.Value = identifier;
                        sqlCommand.Parameters.Add(identifierParameter);

                        sqlCommand.ExecuteNonQuery();

                        EventLog.WriteEntry(sSource, "Analytics data is added", EventLogEntryType.Information);

                        isAdditionSuccess = true;

                    }
                }
            }
            catch (Exception generalException)
            {
                String message = "SessionId:" + sessionId + "| callerId:" + callerId + "| PageName:" + pageName + "| action:" + action + "| identifier:" + identifier;
                EventLog.WriteEntry(sSource, "Error adding Analytics data:" + generalException.Message + " " + message, EventLogEntryType.Error);
            }
            finally
            {
                sqlConnection.Close();
            }

            return isAdditionSuccess;

        }
   

     
    }
}
