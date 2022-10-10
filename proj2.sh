# sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt-get update
sudo apt-get install openjdk-11-jdk
sudo apt install python3-pip zip unzip

pip install -r requirements.txt

export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

kaggle competitions list | while read LINE; do

    if [[ $LINE == Warning* ]] || [[ $LINE == ref* ]] || [[ $LINE == -* ]] ; then
        continue
    fi

    ELEMENTS=($LINE)
    PROJECT="${ELEMENTS[0]}"
    echo $PROJECT

    rm -rf $PROJECT
    mkdir $PROJECT
    cd $PROJECT

    kaggle competitions download -c $PROJECT
    unzip $PROJECT

    cd ..
    python3 proj2.py $PROJECT

    break

done