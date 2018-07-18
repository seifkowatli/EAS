public class CourseExam
    {

        public int Exam_ID;
        public string Exam_Type;
        public string Course_Name;
        public int Semster_ID;
        public int Course_ID;
    }


    public class TopicPercentage
    {
        public String Text;
        public double percentage;

    }

    public class Difficulty
    {
        public String VeryEasy;
        public String Easy;
        public String Avarage;
        public String Difficult;
        public String VeryDifficult;
    }

    public class ThinkingSkills
    {
        public String Recall;
        public String Analysis;
        public String Understanding;
        public String Compiling;
        public String CriticalThinking;
    }

    public class ExamInfo
    {
        public double TotalGrade;
        public double ExamPeriod;
        public List<TopicPercentage> TopicPercentage;
        public Difficulty Difficulty ;
        public ThinkingSkills ThinkingSkills ;
        public int ExamID;

        public ExamInfo()
        {
            TopicPercentage = new List<TopicPercentage>();
            Difficulty =  new Difficulty ();
            ThinkingSkills = new ThinkingSkills();
        }