using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.IO;
using System.Text;

namespace OES_Services.Security
{
    public class DES
    {
        static byte[] bytes = ASCIIEncoding.ASCII.GetBytes("ZeroCoov");

        public static String Encrypt(string String)
        {

            if (String.IsNullOrEmpty(String))
            {
                throw new ArgumentNullException
                       ("The string which needs to be encrypted can not be null.");
            }
            DESCryptoServiceProvider cryptoProvider = new DESCryptoServiceProvider();
            MemoryStream memoryStream = new MemoryStream();//reads and writes to the memory ,classes derive from the Stream class
            CryptoStream cryptoStream = new CryptoStream(memoryStream,
                   cryptoProvider.CreateEncryptor(bytes, bytes), CryptoStreamMode.Write);

            StreamWriter writer = new StreamWriter(cryptoStream);
            writer.Write(String);
            writer.Flush();
            cryptoStream.FlushFinalBlock();
            writer.Flush();
            return Convert.ToBase64String(memoryStream.GetBuffer(), 0, (int)memoryStream.Length);

        }
        //initialization vector (IV) for the symmetric algorithm.   
        //The IV property is automatically set to a new random value whenever you create ...
        //a new instance of one of the SymmetricAlgorithm classes or when you manually call the GenerateIV method. The size of the IV property must be the same as the BlockSize property divided by 8.
        //The classes that derive from the SymmetricAlgorithm class use a chaining mode called cipher block chaining (CBC), which requires a key (Key) and an initialization vector (IV) to perform cryptographic transformations on data
        public static string Decrypt(string String)
        {
            if (String.IsNullOrEmpty(String))
            {
                throw new ArgumentNullException
                   ("The string which needs to be decrypted can not be null.");
            }
            DESCryptoServiceProvider cryptoProvider = new DESCryptoServiceProvider();
            MemoryStream memoryStream = new MemoryStream
                    (Convert.FromBase64String(String));
            CryptoStream cryptoStream = new CryptoStream(memoryStream,
                cryptoProvider.CreateDecryptor(bytes, bytes), CryptoStreamMode.Read);
            StreamReader reader = new StreamReader(cryptoStream);
            return reader.ReadToEnd();
        }


    }
}