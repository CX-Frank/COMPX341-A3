#pipeline

#Check for compile-time errors in the code and show error message
function error_message {
    if [ $? -ne 0 ]
    then
        echo 'An Error occurred at: ' $1
        exit 1
    fi
}


#Update
npm install

#Build the application
npm run build
#CHeck compile time error when build the application
error_message 'npm run build'
echo 'Application build successful!'

#Check if there is commit message or not
if [ -z "$1" ]
then
    echo 'Error: No commit message!'
    exit 0
fi
#Add the file
git add -A
#Add commit
git commit -m "COMPX341-22A- ${1}"
error_message 'git commit -m $'
#Push file to Github
git push origin main
error_message 'git push origin master'
#Retuan Success message
echo 'Successfully deployed!'
#Start running the software
npm run start

