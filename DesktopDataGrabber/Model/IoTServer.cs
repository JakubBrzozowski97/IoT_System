﻿using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace DesktopDataGrabber.Model
{
    public class IoTServer
    {
        private string ip;

        public IoTServer(string _ip)
        {
            ip = _ip;
        }

        /**
         * @brief obtaining the address of the data file from IoT server IP.
         */
        private string GetFileUrl()
        {
            return "http://" + ip + "/server/chartdata.json";
        }

        /**
         * @brief obtaining the address of the PHP script from IoT server IP.
         */
        private string GetScriptUrl_IMU()
        {
            return "http://" + ip + "/sensors_via_deamon.php?id=rpy";
        }

        private string GetScriptUrl_ENV()
        {
            return "http://" + ip + "/sensors_via_deamon.php?id=env";
        }

        


        /**
          * @brief HTTP GET request using HttpClient
          */
        public async Task<string> GETwithClient()
        {
            string responseText = null;

            try
            {
                using (HttpClient client = new HttpClient())
                {
                    responseText = await client.GetStringAsync(GetFileUrl());
                }
            }
            catch (Exception e)
            {
                Debug.WriteLine("NETWORK ERROR");
                Debug.WriteLine(e);
            }

            return responseText;
        }

        /**
          * @brief HTTP POST request using HttpClient
         */
        public async Task<string> POSTwithClient(string which_data)
        {
            string responseText = null;
            try
            {
                using (HttpClient client = new HttpClient())
                {
                    if (which_data == "rpy")
                    {
                        // POST request data
                        var requestDataCollection = new List<KeyValuePair<string, string>>();
                        requestDataCollection.Add(new KeyValuePair<string, string>("filename", "chartdata"));
                        var requestData = new FormUrlEncodedContent(requestDataCollection);
                        // Sent POST request
                        var result = await client.PostAsync(GetScriptUrl_IMU(), requestData);
                        // Read response content
                        responseText = await result.Content.ReadAsStringAsync();
                    }
                    else if (which_data == "env")
                    {
                        // POST request data
                        var requestDataCollection = new List<KeyValuePair<string, string>>();
                        requestDataCollection.Add(new KeyValuePair<string, string>("filename", "chartdata"));
                        var requestData = new FormUrlEncodedContent(requestDataCollection);
                        // Sent POST request
                        var result = await client.PostAsync(GetScriptUrl_ENV(), requestData);
                        // Read response content
                        responseText = await result.Content.ReadAsStringAsync();
                    }
                }
            }
            catch (Exception e)
            {
                Debug.WriteLine("NETWORK ERROR");
                Debug.WriteLine(e);
            }

            return responseText;
        }

        public async Task<string> POSTwithClient_send_led(string x, string y, string r, string g, string b)
        {
            string responseText_send = null;
            string url = "http://" + ip + "/cgi-bin/led_display.py?x=" + x + ";y=" + y + ";r=" + r + ";g=" + g + ";b=" +b;
            try
            {
                using (HttpClient client = new HttpClient())
                {
                    // POST request data
                    var requestDataCollection = new List<KeyValuePair<string, string>>();
                    requestDataCollection.Add(new KeyValuePair<string, string>("filename", "data"));

                    var requestData = new FormUrlEncodedContent(requestDataCollection);
                    // Sent POST request
                    var result = await client.PostAsync(url, requestData);
                    // Read response content
                    responseText_send = await result.Content.ReadAsStringAsync();

                }
            }
            catch (Exception e)
            {
                Debug.WriteLine("NETWORK ERROR");
                Debug.WriteLine(e);
            }
            return responseText_send;
        }

        public async Task<string> POSTwithClient_send_text(string text, string r, string g, string b)
        {
            string responseText_send = null;
            string url = "http://" + ip + "/cgi-bin/display_text.py?text=" + text + ";r=" + r + ";g=" + g + ";b=" + b;
            try
            {
                using (HttpClient client = new HttpClient())
                {
                    // POST request data
                    var requestDataCollection = new List<KeyValuePair<string, string>>();
                    requestDataCollection.Add(new KeyValuePair<string, string>("filename", "data"));

                    var requestData = new FormUrlEncodedContent(requestDataCollection);
                    // Sent POST request
                    var result = await client.PostAsync(url, requestData);
                    // Read response content
                    responseText_send = await result.Content.ReadAsStringAsync();

                }
            }
            catch (Exception e)
            {
                Debug.WriteLine("NETWORK ERROR");
                Debug.WriteLine(e);
            }
            return responseText_send;
        }
        /**
          * @brief HTTP GET request using HttpWebRequest
          */
        public async Task<string> GETwithRequest()
        {
            string responseText = null;

            try
            {
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(GetFileUrl());

                request.Method = "GET";

                using (HttpWebResponse response = (HttpWebResponse)await request.GetResponseAsync())
                using (Stream stream = response.GetResponseStream())
                using (StreamReader reader = new StreamReader(stream))
                {
                    responseText = await reader.ReadToEndAsync();
                }
            }
            catch (Exception e)
            {
                Debug.WriteLine("NETWORK ERROR");
                Debug.WriteLine(e);
            }

            return responseText;
        }

        /**
          * @brief HTTP POST request using HttpWebRequest
          */
        public async Task<string> POSTwithRequest()
        {
            string responseText = null;

            try
            {
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(GetScriptUrl_IMU());

                // POST Request data 
                var requestData = "filename=chartdata";
                byte[] byteArray = Encoding.UTF8.GetBytes(requestData);
                // POST Request configuration
                request.Method = "POST";
                request.ContentType = "application/x-www-form-urlencoded";
                request.ContentLength = byteArray.Length;
                // Wrire data to request stream
                Stream dataStream = request.GetRequestStream();
                dataStream.Write(byteArray, 0, byteArray.Length);
                dataStream.Close();

                using (HttpWebResponse response = (HttpWebResponse)await request.GetResponseAsync())
                using (Stream stream = response.GetResponseStream())
                using (StreamReader reader = new StreamReader(stream))
                {
                    responseText = await reader.ReadToEndAsync();
                }
            }
            catch (Exception e)
            {
                Debug.WriteLine("NETWORK ERROR");
                Debug.WriteLine(e);
            }

            return responseText;
        }
    }
}
