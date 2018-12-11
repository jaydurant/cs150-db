// Assignment 11.sql 
//    Jason Durant
//    CS 150A, Fall 2018

// Question 1
db = connect("localhost:27017/library");

// Question 2
print("Question2");
insertedUser = db.user.insert({
    display: "Rachel Cunningham",
    fname: "rachel",
    lname: "cunningham",
    type: "student",
    age: 24,
    checkouts:[]
});

// Question 3
print("Question3")
db.user.find({"checkouts.subject": 'cloud' }, {display: 1, age: 1});

// Question 4
print("Question4")
db.user.find({checkouts: {$elemMatch :{subject:'programming'}} }, {fname: 1, lname: 1, type: 1, _id:0});

//Question 5
print("Question5")
db.user.find({$or:[{type:'faculty','checkouts.book': '5235'},{type:'student',age:{$lt:30},'checkouts.book':'5240'}]}).pretty();

//Question 6
print("Question6")
db.user.find({age:{$gte: 22, $lte:26}}, {fname:1, lname:1, age:1, _id:0});
