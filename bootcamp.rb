class Bootcamp
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new { |hash, k| hash[k] = [] }
    end

    def name
        @name
    end

    def slogan
        @slogan
    end

    def teachers
        @teachers
    end

    def students
        @students
    end

    def hire(string)
        @teachers << string
    end

    def enroll(string)
        if @students.count < @student_capacity
            @students << string
            return true
        else
            return false
        end
    end

    def enrolled?(string)
        return true if @students.include?(string)
        false
    end

    def student_to_teacher_ratio
        (@students.count/@teachers.count).round
    end

    def add_grade(who, grade)
        if self.enrolled?(who)
            @grades[who] << grade
            return true
        else
            return false
        end
    end

    def num_grades(string)
        @grades[string].length
    end

    def average_grade(who)
        if @grades.has_key?(who)
            (@grades[who].sum(0.0)/@grades[who].length).round(half: :down)
        else
            return nil
        end
    end
 
end
