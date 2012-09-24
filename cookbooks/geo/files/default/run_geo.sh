#Start Solr
cd /opt/apache-solr-3.6.0/example/
java -jar start.jar &

#Run our Python script to fetch KML and make solr index files with <document> elements
#python /opt/geo/rdamap.py

#Index all the KML files in solr
#./post.sh *.xml

#now you can search
#curl http://115.146.92.238/solr/select?wt=json&indent=true&fl=name,store&q=*:*&fq={!geofilt%20pt=45.15,-93.85%20sfield=store%20d=1}

#Run the little webserver
python /opt/geo/KMLServer.py 443
