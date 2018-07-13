using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace OES_Services.Security
{
    public class RSA
    {
        private static string _privateKey;
        private static string _publicKey;
        private static UnicodeEncoding _encoder = new UnicodeEncoding();

        public static string Decrypt(string data)
        {
            var rsa = new RSACryptoServiceProvider();
            var dataArray = data.Split(new char[] { ',' });
            byte[] dataByte = new byte[dataArray.Length];
            for (int i = 0; i < dataArray.Length; i++)
            {
                dataByte[i] = Convert.ToByte(dataArray[i]);
            }

            rsa.FromXmlString(_privateKey);
            var decryptedByte = rsa.Decrypt(dataByte, false);
            return _encoder.GetString(decryptedByte);
        }

        public static string Encrypt(string data)
        {
            var rsa = new RSACryptoServiceProvider();
            rsa.FromXmlString(_publicKey);
            var dataToEncrypt = _encoder.GetBytes(data);
            var encryptedByteArray = rsa.Encrypt(dataToEncrypt, false).ToArray();
            var length = encryptedByteArray.Count();
            var item = 0;
            var sb = new StringBuilder();
            foreach (var x in encryptedByteArray)
            {
                item++;
                sb.Append(x);

                if (item < length)
                    sb.Append(",");
            }

            return sb.ToString();
        }


        static void Main(string[] args)
        {

            //    var rsa = new RSACryptoServiceProvider();
            // _privateKey = rsa.ToXmlString(true);
            // _publicKey = rsa.ToXmlString(false);


            _privateKey = File.ReadAllText(@"C:\Users\Al-Doon\Documents\visual studio 2017\Projects\RSA-Encription\RSA-Encription\bin\Debug\_privateKey.xml");
            _publicKey = File.ReadAllText(@"C:\Users\Al-Doon\Documents\visual studio 2017\Projects\RSA-Encription\RSA-Encription\bin\Debug\_publicKey.xml");

            //    File.WriteAllText("_privateKey.xml", _privateKey);
            //  File.WriteAllText("_publicKey.xml", _publicKey);


            var text = "Test12";
            Console.WriteLine("RSA // Text to encrypt: " + text);
            var enc = Encrypt(text);
            Console.WriteLine("RSA // Encrypted Text: " + enc);
            var dec = Decrypt(enc);
            Console.WriteLine("RSA // Decrypted Text: " + dec);
        }
    }
}