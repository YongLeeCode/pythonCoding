//var

// var는 한번 선언된 변수를 다시 선언할 수 있다.
// 함수 스코프(function-scoped)
// 블록에서 var로 선언해도 밖에서 사용가능
if(age > 20){
    var txt = '성인';
}
console.log(txt); //밖에서도 '성인'으로 선언 가능

var name = 'mike';
console.log(name); //mike

var name = 'jane';
console.log(name); //jane

//var는 선언하기 전에 사용할 수 있다.
var name;
console.log(name); //undefined
name = 'mike'; 


//let

// let은 한번 선언된 변수는 다시 선언 불가
// 블록 스코프(block-scoped) - 코드 블럭 내에서만 사용가능
//ex) 함수, if문, for문, while문, try/catch문 등
if(age > 20){
    let txt = '성인';
}
console.log(txt); //밖에서는 '성인'으로 선언 x

let name = 'mike';
console.log(name); //mike

let name = 'jane';
console.log(name); //error
//error 내용 - Uncaught SyntaxError: Identifier 
//             'name' has already benn declared


//const

//const는 선언+ 초기화 + 할당이 동시에 되어야한다.
// 블록 스코프(block-scoped) - 코드 블럭 내에서만 사용가능

/* there is an error because const should make one line for declare
const gender;
gender = 'male'; //에러 발생 (error happened)
*/

const age ='20'; // 정상 작동