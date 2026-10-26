#!bin/bash
mkdir House
cd House
mkdir floor1|mkdir floor2
cd floor1
mkdir kitchen|mkdir bathroom|mkdir living_room
cd bathroom
touch shampoo.doc|touch toothbrash.doc|touch soap.doc
cd ..
cd kitchen
touch waven.doc|touch refrigerator.doc|touch dishwasher.txt
cd ..
cd living_room
touch bed.txt|touch closet.txt|touch mirror.txt 
cd ..
cd ..
cd floor2
mkdir office|mkdir living_room|mkdir library
cd library
touch tolstoy.doc|touch chehov.doc|touch pushkin.doc
cd -
cd living_room
touch bed.txt|touch closet.txt|touch mirror.doc
cd ..
cd office
touch desktop.txt|touch documents.txt|touch computer.txt
