/* Lesson 3 */

/* FUNCTIONS */

// Step 1: Using function declaration, define a function named add that takes two arguments, number1 and number2
// Step 2: In the function, return the sum of the parameters number1 and number2
function add(number1, number2){
    let sum = number1 + number2;
    return sum;
}
// Step 3: Step 3: Using function declaration, define another function named addNumbers that gets the values of two HTML form controls with IDs of addend1 and addend2. Pass them to the add function
// Step 4: Assign the return value to an HTML form element with an ID of sum

function addNumbers(){
    let num1 = parseInt(document.querySelector("#addend1").value);
    let num2 = Number(document.getElementById("addend2").value);
    //parse하고 타입 바꾸기 혹은 number을 넣어도됨
    //ex) parseInt, parseFloat, number
    document.getElementById("sum").value = add(num1,num2);
}

// Step 5: Add a "click" event listener to the HTML button with an ID of addNumbers that calls the addNumbers function
document.getElementById("addNumbers").addEventListener('click',addNumbers);

// Step 6: Using function expressions, repeat Steps 1-5 with new functions named subtract and subtractNumbers and HTML form controls with IDs of minuend, subtrahend, difference and subtractNumbers
function subtract(number3, number4){
    let difference = number3 - number4;
    return difference;
}

function subtractNumbers(){
    let num3 = parseInt(document.querySelector("#minuend").value);
    let num4 = Number(document.getElementById("subtrahend").value);
    document.getElementById("difference").value = subtract(num3,num4);
}
document.getElementById("subtractNumbers").addEventListener('click',subtractNumbers);

// Step 7: Using arrow functions, repeat Steps 1-5 with new functions named multiply and mulitplyNumbers and HTML form controls with IDs of factor1, factor2, product and multiplyNumbers
function multiple(number5, number6){
    let product = number5 * number6;
    return product;
}

function multiplyNumbers(){
    let num5 = parseInt(document.querySelector("#factor1").value);
    let num6 = Number(document.getElementById("factor2").value);
    document.getElementById("product").value = multiple(num5,num6);
}
document.getElementById("multiplyNumbers").addEventListener('click',multiplyNumbers);

// Step 8: Using any of the three function declaration types, repeat Steps 1-5 with new functions named divide and divideNumbers and HTML form controls with IDs of dividend, divisor, quotient and divideNumbers
function divide(number7, number8){
    let quotient = number7 / number8;
    return quotient;
}

function divideNumbers(){
    let num7 = parseInt(document.querySelector("#dividend").value);
    let num8 = Number(document.getElementById("divisor").value);
    document.getElementById("quotient").value = divide(num7,num8);
}
document.getElementById("divideNumbers").addEventListener('click',divideNumbers);
// Step 9: Test all of the mathematical functionality of the task3.html page.


/* BUILT-IN METHODS */

// Step 1: Declare and instantiate a variable of type Date to hold the current date
const currentDate = new Date();

// Step 2: Declare a variable to hold the current year
let current;
// Step 3: Using the variable declared in Step 1, call the built-in getFullYear() method/function and assign it to the variable declared in Step 2
current = currentDate.getFullYear();
// Step 4: Assign the current year variable to an HTML form element with an ID of year
document.getElementById("current").textContent = current;

/* ARRAY METHODS */

// Step 1: Declare and instantiate an array variable to hold the numbers 1 through 25

let numbers = [];
for (let i = 1; i <= 25; i++){
    numbers.push(i);
};

console.log(numbers);

// Step 2: Assign the value of the array variable to the HTML element with an ID of "array"
document.querySelector("#array").textContent = numbers;
// Step 3: Use the filter array method to find all of the odd numbers of the array variable and assign the reult to the HTML element with an ID of "odds" ( hint: % (modulus operartor) )
document.querySelector("#odds").textContent = numbers.filter(
    (number) => number % 2
);
// Step 4: Use the filter array method to find all of the even numbers of the array variable and assign the result to the HTML element with an ID of "evens"
document.querySelector("#evens").textContent = numbers.filter(
    (number) => number %2 === 0
);
// Step 5: Use the reduce array method to sum the array variable elements and assign the result to the HTML element with an ID of "sumOfArray"
document.querySelector("#sumOfArray").textContent = numbers.reduce(
    (sum, number) => sum + number,
    0
  );
// Step 6: Use the map array method to multiple each element in the array variable by 2 and assign the result to the HTML element with an ID of "multiplied"
document.querySelector("#multiplied").textContent = numbers.map(
    (number) => number * 2
  );
// Step 7: Use the map and reduce array methods to sum the array elements after multiplying each element by two.  Assign the result to the HTML element with an ID of "sumOfMultiplied"
document.querySelector("#sumOfMultiplied").textContent = numbers
  .map((number) => number * 2)
  .reduce((sum, number) => sum + number, 0);