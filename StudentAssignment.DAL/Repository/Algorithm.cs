
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StudentAssignment.DAL.Repository
{
    public static class Algorithm
    {
        public static void ShuffleEvenOdd()
        {
            int[] arrList = { 2, 23, 59, 19, 24, 10, 29 };
            int j = -1, temp;
            for (int i = 0; i < arrList.Length; i++)
            {
                if (arrList[i] % 2 == 0)
                {
                    j++;
                    temp = arrList[i];
                    arrList[i] = arrList[j];
                    arrList[j] = temp;
                }
            }
        }
    }
}
