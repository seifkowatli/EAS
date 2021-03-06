USE [EAS_Database]
GO
SET IDENTITY_INSERT [dbo].[Topics] ON 

INSERT [dbo].[Topics] ([Id], [Topic_Name]) VALUES (1, N'Stupid_Questions')
INSERT [dbo].[Topics] ([Id], [Topic_Name]) VALUES (2, N'C++ Types')
INSERT [dbo].[Topics] ([Id], [Topic_Name]) VALUES (3, N' C++ Arrays')
INSERT [dbo].[Topics] ([Id], [Topic_Name]) VALUES (4, N'C++ Structures')
INSERT [dbo].[Topics] ([Id], [Topic_Name]) VALUES (5, N'C++ Functions')
INSERT [dbo].[Topics] ([Id], [Topic_Name]) VALUES (6, N'C++ Macros')
INSERT [dbo].[Topics] ([Id], [Topic_Name]) VALUES (7, N' C++ Classes')
INSERT [dbo].[Topics] ([Id], [Topic_Name]) VALUES (8, N'C++ Objects')
SET IDENTITY_INSERT [dbo].[Topics] OFF
SET IDENTITY_INSERT [dbo].[Questions_Bank] ON 

INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (4, N'What is the color of the sky', N'3', 1, 0, N'reading', 1, 1, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (5, N'what is the color of the fire', N'5', 1, 0, N'reading ', 2, 1, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (6, N' What is the size of wchar_t in C++?', N'2', 1, 0, N'Analysis', 2, 2, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (7, N'Pick the odd one out', N'2', 1, 0, N'Recall', 2, 2, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (8, N'Which datatype is used to represent the absence of parameters?', N'2', 1, 0, N'Recall', 2, 2, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (9, N'What does a escape code represent?', N'2', 1, 0, N'Recall', 2, 2, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (10, N'Which type is best suited to represent the logical values?', N'4', 2, 0, N'Recall', 3, 2, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (11, N'Identify the user-defined types from the following?', N'3', 2, 0, N'Analysis', 2, 2, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (12, N'Which of the following statements are true?', N'3', 3, 0, N'Analysis', 2, 2, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (13, N' The value 132.54 can represented using which data type?', N'5', 4, 0, N'Analysis', 3, 2, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (14, N'When a language has the capability to produce new data type mean, it can be called as', N'5', 4, 0, N'Analysis', 3, 2, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (15, N'Pick the odd one out.', N'5', 5, 0, N'Analysis', 3, 2, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (16, N'Which of the following correctly declares an array?', N'2', 1, 0, N'Understanding', 1, 3, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (17, N'What is the index number of the last element of an array with 9 elements?', N'2', 1, 0, N'Understanding', 1, 3, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (18, N'What is a array?', N'2', 1, 0, N'Understanding', 1, 3, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (19, N'Which of the following accesses the seventh element stored in array?', N'4', 2, 0, N'Analysis', 3, 3, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (20, N'Which of the following gives the memory address of the first element in array?', N'4', 2, 0, N'Analysis', 3, 3, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (21, N'What is the output of this program?

    #include <stdio.h>
    using namespace std;
    int main()
    {
        int a = 5, b = 10, c = 15;
        int arr[3] = {&a, &b, &c};
        cout << *arr[*arr[1] - 8];
        return 0;
    }', N'5', 3, 0, N'Analysis', 2, 3, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (22, N'What is the output of this program?

    #include <stdio.h>
    using namespace std;
    int main()
    {
        int array[] = {10, 20, 30};
        cout << -2[array];
        return 0;
    }', N'5', 3, 0, N'Analysis', 2, 3, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (23, N'The data elements in structure are also known as what?', N'2', 2, 0, N'Recall', 2, 4, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (24, N'. What will be used when terminating a structure?', N'2', 2, 0, N'Recall', 2, 4, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (25, N'. What will be used when terminating a structure?', N'3', 2, 0, N'Compiling', 2, 4, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (26, N'The declaration of structure is also called as?', N'3', 2, 0, N'Compiling', 2, 4, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (29, N'Which of the following is a properly defined structure?', N'3', 2, 0, N'Compiling', 2, 4, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (30, N'Which of the following accesses a variable in structure *b?', N'3', 2, 0, N'Compiling', 2, 4, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (33, N'Where does the execution of the program starts?', N'3', 2, 0, N'Compiling', 2, 5, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (34, N'What are mandatory parts in function declaration?', N'3', 2, 0, N'Compiling', 2, 5, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (35, N'which of the following is used to terminate the function declaration?', N'2', 4, 0, N'Compiling', 3, 5, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (36, N'How many max number of arguments can present in function in c99 compiler?', N'2', 4, 0, N'Compiling', 3, 5, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (37, N'Which is more effective while calling the functions?', N'2', 4, 0, N'Compiling', 3, 5, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (38, N'What is the scope of the variable declared in the user definied function?', N'3', 2, 0, N'Critical Thikning', 1, 5, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (39, N'How many minimum number of functions are need to be presented in c++?', N'3', 2, 0, N'Critical Thikning', 1, 5, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (40, N'How many ways of passing a parameter are there in c++?', N'2', 2, 0, N'Critical Thikning', 1, 5, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (41, N' Which is used to keep the call by reference value as intact?', N'2', 2, 0, N'Critical Thikning', 1, 5, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (42, N'By default how the value are passed in c++?', N'5', 4, 0, N'Critical Thikning', 3, 5, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (43, N'What will happen when we use void in argument passing?', N'4', 4, 0, N'Critical Thikning', 3, 5, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (45, N'What is the output of this program?

    #include <iostream>
    using namespace std;
    void Sum(int a, int b, int & c)
    {
        a = b + c;
        b = a + c;
        c = a + b;
    }
    int main()
    {
        int x = 2, y =3;
        Sum(x, y, y);
        cout << x << " " << y;
        return 0; 
    }', N'7', 5, 0, N'Critical Thikning', 5, 5, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (46, N'How many types of returning values are present in c++?', N'1', 1, 0, N'Critical Thikning', 1, 5, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (47, N'What will you use if you are not intended to get a return value?', N'1', 1, 0, N'Understanding', 1, 5, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (48, N'Where does the return statement returns the execution of the program?', N'1', 3, 0, N'Compiling', 1, 5, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (49, N' What is the output of this program?

    #include <iostream>
    using namespace std;
    int max(int a, int b )
    {
        return ( a > b ? a : b );
    }
    int main()
    {
        int i = 5;
        int j = 7;
        cout << max(i, j );
        return 0;
    }', N'6', 3, 0, N'Recall', 2, 5, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (50, N'What is the output of this program?

    #include <iostream>
    using namespace std;
    double & WeeklyHours()
    {
        double h = 46.50;
        double &hours = h;
        return hours;
    }
    int main()
    {
        double hours = WeeklyHours();
        cout << "Weekly Hours: " << hours;
        return 0;
    }', N'6', 3, 0, N'Recall', 2, 5, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (51, N'When will we use the function overloading?', N'3', 3, 0, N'Recall', 2, 5, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (52, N'which keyword is used to define the macros in c++?', N'3', 3, 0, N'Recall', 2, 6, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (54, N'Which symbol is used to declare the preprocessor directives?', N'4', 3, 0, N'Understanding', 1, 6, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (55, N'How many types of macros are there in c++?', N'4', 3, 0, N'Understanding', 1, 6, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (56, N'What is the mandatory preprosessor directive for c++?', N'4', 4, 0, N'Critical Thikning', 1, 6, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (57, N' What is the output of this program?

    #include <iostream>
    using namespace std;
    #define MIN(a,b) (((a)<(b)) ? a : b)
    int main ()
    {
        float i, j;
        i = 100.1;
        j = 100.01;
        cout <<"The minimum is " << MIN(i, j) << endl;
        return 0;
    }', N'4', 4, 0, N'Critical Thikning', 1, 6, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (58, N'What is the output of this program?

    #include <iostream>
    using namespace std;
    #define SquareOf(x) x * x
    int main()
    {
        int x;
        cout << SquareOf(x + 4);
        return 0;
    }', N'4', 4, 0, N'Critical Thikning', 4, 6, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (59, N'What is the other name of the macro?', N'4', 5, 0, N'Understanding', 4, 6, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (60, N'What does your class can hold?', N'1', 5, 0, N'Understanding', 4, 7, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (61, N'Which is used to define the member of a class externally', N'1', 5, 0, N'Understanding', 4, 7, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (62, N'How many specifiers are present in access specifiers in class?', N'1', 5, 0, N'Understanding', 4, 7, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (63, N'Which other keywords are also used to declare the class other than class?', N'5', 5, 0, N'Understanding', 5, 7, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (64, N'What is the output of this program?

    #include <iostream>
    using namespace std;
    class rect
    {
        int x, y;
        public:
        void val (int, int);
        int area ()
        {
            return (x * y);
        }
    };
    void rect::val (int a, int b)
    {
        x = a;
        y = b;
    }
    int main ()
    {
        rect rect;
        rect.val (3, 4);
        cout << "rect area: " << rect.area();
        return 0;
    }', N'6', 5, 0, N'Understanding', 5, 7, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (65, N'Which of the following is a valid class declaration?', N'1', 5, 0, N'Analysis', 4, 7, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (66, N'The fields in the class in c++ program are by default', N'1', 5, 0, N'Recall', 4, 7, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (67, N'Constructors are used to', N'1', 5, 0, N'Recall', 4, 7, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (68, N'When struct is used instead of the keyword class means, what will happen in the program?', N'1', 5, 0, N'Compiling', 4, 7, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (69, N'Where does the object is created?', N'1', 1, 0, N'Critical Thikning', 4, 8, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (70, N'How to access the object in the class?', N'1', 2, 0, N'Critical Thikning', 5, 8, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (71, N'Which of these following members are not accessed by using direct member access ', N'2', 3, 0, N'Recall', 5, 8, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (72, N'What is the output of the following program?

    #include <iostream>
    using namespace std;
    class Box
    {
        public :
        double length;
        double breadth;
        double height;
    };
    int main( )
    {
        Box Box1;
        double volume;
        Box1.height = 5;
        Box1.length = 6;
        Box1.breadth = 7.1;
        volume = Box1.height * Box1.length * Box1.breadth;
        cout << "Volume of Box1 : " << volume <<endl;
        return 0;
    }', N'5', 3, 0, N'Understanding', 5, 8, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (73, N' Pick out the other definition of objects.', N'3', 3, 0, N'Analysis', 3, 8, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (74, N'How many objects can present in a single class?', N'2', 3, 0, N'Compiling', 2, 8, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (75, N'What is the output of this program?

    #include <iostream>
    using namespace std;
    class sample
    {
        private:
        int var;
        public:
        void input()
        {
           cout << var;
        }
        void output()
        {
           cout << "Variable entered is ";
           cout << var << "\n";
        }
    };
    int main()
    {
        sample object;
        object.input();
        object.output();
        object.var();
        return 0;
    }', N'2', 3, 0, N'Critical Thikning', 2, 8, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (76, N'Which special character is used to mark the end of class?', N'2', 3, 0, N'Compiling', 2, 8, NULL)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Question_Text], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark], [Topic_Id], [Exam_Id]) VALUES (77, N'What is the output of this program?

    #include <iostream>
    using namespace std;
    class number
    {
        int i;
        public:
        int geti();
        void puti(int j);
    };
    int number::geti()
    {
        return i;
    }
    void number::puti(int j)
    {
        i = j;
    }
    int main()
    {
        number s;
        s.puti(10);
        cout << s.geti( );
        return 0;
    }', N'2', 3, 0, N'Analysis', 3, 8, NULL)
SET IDENTITY_INSERT [dbo].[Questions_Bank] OFF
SET IDENTITY_INSERT [dbo].[Question_Answers] ON 

INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (4, 1, N'red', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (4, 2, N'green', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (4, 3, N'blue', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (4, 4, N'pink', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (5, 5, N'red', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (5, 6, N'white', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (5, 7, N'black', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (5, 8, N'brown', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (6, 9, N'2', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (6, 10, N'4', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (6, 11, N'2 OR 4', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (6, 12, N'based on the number of bits in the system', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (7, 13, N' boolean type', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (7, 14, N' integer type', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (7, 15, N'character type', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (7, 16, N'array type', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (8, 17, N' int', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (8, 18, N' short', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (8, 19, N'float', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (8, 20, N' void', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (9, 33, N'backslash', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (9, 34, N'tab', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (9, 35, N'form feed', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (9, 36, N'alert', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (10, 37, N'integer', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (10, 38, N'character', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (10, 39, N'all of the mentioned', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (10, 40, N'boolean', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (11, 49, N'enumeration', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (11, 50, N'classes', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (11, 51, N'int', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (11, 52, N' both enumeration and classes', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (12, 53, N'f is a function taking an argument of type int and retruning a floating point number', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (12, 54, N'f is a function of type float', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (12, 55, N'  none of the mentioned', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (12, 56, N' f is a function taking an argument of type float and returning a integer', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (13, 57, N'int', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (13, 58, N'void', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (13, 59, N'bool', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (13, 60, N'double', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (14, 61, N'overloaded', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (14, 62, N'encapsulated', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (14, 63, N'reprehensible', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (14, 64, N'extensible', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (15, 65, N' integer, character, boolean, floating', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (15, 66, N'enumeration, classes', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (15, 67, N'arrays, pointer, classes', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (15, 68, N' integer, enum, void', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (16, 69, N'int array;', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (16, 70, N' array{10};', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (16, 71, N' array array[10];', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (16, 72, N'int array[10];', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (17, 73, N'9', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (17, 74, N' 0', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (17, 75, N'Programmer-Defind', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (17, 76, N'8', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (18, 77, N' An array is a series of element', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (18, 78, N'None of the mentioned', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (18, 79, N'An array is a series of elements of the same type placed in non-contiguous memory locations', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (18, 80, N' An array is a series of elements of the same type in contiguous memory locations', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (19, 81, N' array;', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (19, 82, N' array[7];', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (19, 83, N' array(7);', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (19, 84, N' array[6];', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (20, 85, N' array[0];', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (20, 86, N' array[1];', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (20, 87, N' array(2);', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (20, 88, N'  array;', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (21, 89, N'15', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (21, 90, N'18', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (21, 91, N'garbage value', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (21, 92, N'compile time error', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (22, 93, N'-15', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (22, 94, N'compile time error', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (22, 95, N'garbage value', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (22, 96, N'-30', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (23, 97, N'objects', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (23, 98, N'datas', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (23, 99, N' none of the mentioned', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (23, 100, N'members', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (24, 101, N':', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (24, 102, N'}', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (24, 103, N';;', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (24, 104, N';', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (25, 105, N'it will allocate the memory', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (25, 106, N' it will be declared and initialized', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (25, 107, N' none of the mentioned', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (25, 108, N'it will not allocate any memory', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (26, 109, N' sructure creator', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (26, 110, N'none of the mentioned', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (26, 111, N'structure signifier', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (26, 112, N'structure specifier', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (29, 125, N'struct {int a;}', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (29, 126, N'struct a_struct {int a;}', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (29, 127, N'struct a_struct int a;', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (29, 128, N' struct a_struct {int a;};', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (30, 129, N'b.var;', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (30, 130, N' b-var;', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (30, 131, N'b>var;', 0)
GO
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (30, 132, N' b->var;', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (33, 141, N'user-defined function', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (33, 142, N'void function', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (33, 143, N'none of the mentioned', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (33, 144, N'main function', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (34, 145, N'return type, function name, parameters', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (34, 146, N'parameters, function name', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (34, 147, N'none of the mentioned', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (34, 148, N'return type, function name', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (35, 149, N':', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (35, 150, N')', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (35, 151, N'none of the mentioned', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (35, 152, N';', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (36, 153, N'99', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (36, 154, N'90', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (36, 155, N'102', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (36, 156, N'127', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (37, 157, N'call by value', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (37, 158, N'call by pointer', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (37, 159, N'non of the mentioned', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (37, 160, N'call by reference', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (38, 161, N'none of the mentioned', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (38, 162, N'main functio', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (38, 163, N'whole program', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (38, 164, N'only inside the {} block', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (39, 165, N'0', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (39, 166, N'2', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (39, 167, N'3', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (39, 168, N'1', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (40, 169, N'1', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (40, 170, N'2', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (40, 171, N'4', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (40, 172, N'3', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (41, 173, N' none of the mentioned', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (41, 174, N' absolute', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (41, 175, N' static', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (41, 176, N'const', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (42, 177, N' call by pointer', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (42, 178, N' call by reference', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (42, 179, N'none of the mentioned', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (42, 180, N'call by value', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (43, 185, N' It will return value to its caller', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (43, 186, N'Maybe or maynot be return any value to its caller', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (43, 187, N'none of the mentioned', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (43, 188, N'It will not return value to its caller', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (45, 197, N'2 3 ', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (45, 198, N'6 9', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (45, 199, N'compile time error', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (45, 200, N'2 15', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (46, 201, N'1 ', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (46, 202, N'2', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (46, 203, N'4', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (46, 204, N'3', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (46, 205, N'static ', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (47, 209, N'static ', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (47, 210, N'const', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (47, 211, N'volatile', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (47, 212, N'void', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (48, 213, N' main function ', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (48, 214, N'same function', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (48, 215, N'none of the mentioned', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (48, 216, N'caller function', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (49, 217, N'5', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (49, 218, N' either 5 or 7', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (49, 219, N'none of the mentioned', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (49, 220, N'7', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (50, 221, N'6.50', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (50, 222, N'compile time error', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (50, 223, N'none of the mentioned', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (50, 224, N'46.5', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (51, 225, N'different function name but same number of arguments', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (51, 226, N'same function name but same number of arguments', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (51, 227, N'different function name but different number of arguments', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (51, 228, N'same function name but different number of arguments', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (52, 229, N'macro', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (52, 230, N'define', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (52, 231, N'none of the mentioned', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (52, 232, N'#define', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (54, 241, N'$', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (54, 242, N'*', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (54, 243, N'^', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (54, 244, N'#', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (55, 245, N'1', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (55, 246, N'3', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (55, 247, N'4', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (55, 248, N'2', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (56, 249, N' #undef <iostream>', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (56, 250, N'#define <iostream>', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (56, 251, N'none of the mentioned', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (56, 252, N' #include <iostream>', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (57, 253, N'100.1', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (57, 254, N'compile time error', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (57, 255, N'none of the mentioned', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (57, 256, N'100.01', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (58, 257, N'64', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (58, 258, N'compile time error', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (58, 259, N'16', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (58, 260, N'none of the mentioned', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (59, 261, N'executed directive', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (59, 262, N' link directive', 0)
GO
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (59, 263, N'none of the mentioned', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (59, 264, N'scripted directive', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (60, 265, N'data', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (60, 266, N' data', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (60, 267, N'none of the mentioned', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (60, 268, N'both data & functions', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (61, 269, N':', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (61, 270, N'#', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (61, 271, N'none of the mentioned', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (61, 272, N'::', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (62, 273, N'1', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (62, 274, N'2', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (62, 275, N'4', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (62, 276, N'3', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (63, 277, N'struct', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (63, 278, N'union', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (63, 279, N'object', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (63, 280, N'both struct & union', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (64, 281, N' rect area:12', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (64, 282, N'rect area:24', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (64, 283, N'none of the mentioned', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (64, 284, N'rect area: 12', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (65, 285, N'object A { int x; };', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (65, 286, N'class B { }', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (65, 287, N'public class A { }', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (65, 288, N'class A { int x; };', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (66, 289, N'protected', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (66, 290, N'public', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (66, 291, N'none of the mentioned', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (66, 292, N'private', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (67, 293, N' construct the data members', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (67, 294, N'both initalize the objects & construct the data members', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (67, 295, N'none of the mentioned', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (67, 296, N'initalize the objects', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (68, 297, N'access is private by default', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (68, 298, N'access is protected by default', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (68, 299, N'none of the mentioned', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (68, 300, N'access is public by default', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (69, 301, N'attributes', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (69, 302, N'destructor', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (69, 303, N'constructor', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (69, 304, N'class', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (70, 305, N'scope resolution operator', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (70, 306, N'ternary operator', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (70, 307, N'none of the mentioned', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (70, 308, N'direct member access operator', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (71, 309, N'public', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (71, 310, N' private', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (71, 311, N'protected', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (71, 312, N'both private & protected', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (72, 313, N'210', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (72, 314, N'215', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (72, 315, N'217', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (72, 316, N'213', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (73, 317, N'member of the class', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (73, 318, N'associate of the class', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (73, 319, N'attribute of the class', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (73, 320, N'instance of the class', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (74, 321, N'1', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (74, 322, N'2', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (74, 323, N'3', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (74, 324, N'as many as possible', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (75, 325, N'Enter an integer 5
Variable entered is 5', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (75, 326, N'Runtime error', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (75, 327, N'None of the mentioned', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (75, 328, N'Error', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (76, 329, N':', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (76, 330, N'#', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (76, 331, N'$', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (76, 332, N';', 1)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (77, 333, N'11', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (77, 334, N'20', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (77, 335, N'22', 0)
INSERT [dbo].[Question_Answers] ([Question_ID], [Answer_ID], [Answer_Text], [is_trueAnswer]) VALUES (77, 336, N'10', 1)
SET IDENTITY_INSERT [dbo].[Question_Answers] OFF
