# Create your grading script here

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'
cp TestListExamples.java student-submission/
cp -r lib student-submission/
cd student-submission

if [[ -e ListExamples.java ]]
then 
    echo "file found"
else 
    echo "file not found"
    exit 1
fi 

javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java &> Compile.txt 

if [ $? -eq 0 ]
then 
    echo "passed"
    java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples &> Result.txt

    if grep "OK" Result.txt
    then 
        echo "Test passed, you get 100/100!"
    fi

    if grep "FAILURES" Result.txt
    then 
        echo "Something is wrong!"
        if grep "Failures: 1" Result.txt
        then
            echo "One test failed, you get 50/100!"
        else
            echo "Two test failed, you get 0/100!"
        fi
    fi

else
    cat compile.txt
    echo "Compile error"
    if grep "';' expected" Compile.txt
    then
        echo "Fix it and come back again, you get 50/100 now."
        exit 1
        fi
    if grep "cannot be converted to StringChecker" Compile.txt
    then
        echo "Arguments of filter in the wrong order, so it doesn't match the expected behavior, you get 25/100 now, fix it to get full credit."
        fi

fi