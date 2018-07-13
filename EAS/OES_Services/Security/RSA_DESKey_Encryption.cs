using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace OES_Services.Security
{
    public class RSA_DESKey_Encryption
    {
        static string DESKEY = "ZeroCoov";
        public static void EncryptDESK_Key()
        {

            var RSAenc = RSA.RSAEncrypt(DESKEY);
            File.WriteAllText(@"D:\salim\sunior\EAS1\EAS\EAS\OES_Services\bin\Debug\DESKEY.xml", RSAenc);

        }
        public static string DecryptDESK_Key()
        {
            string key = File.ReadAllText(@"D:\salim\sunior\EAS1\EAS\EAS\OES_Services\bin\Debug\DESKEY.xml");

            string DESkey = RSA.RSADecrypt(key);

            return DESkey;

        }
    }
}