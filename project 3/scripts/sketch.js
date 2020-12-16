let deviceURL = "http://192.168.0.106"; //IP address
let data; //the whole JSON load
let reading ={}; //reading for the specific sensor
let timeInt = 100; //time interval in milliseconds
let currentT, prevT, timeT;

function setup() {
    createCanvas(windowWidth, windowHeight);
    data = loadJSON(deviceURL, parseData, handleError);
}

function draw() {
    currentT = millis()%timeInt;
    timeT=millis();

    //if we chatch a falling edge
    if(currentT < prevT){
        data = loadJSON(deviceURL, parseData, handleError);
    }

    background(((reading.input1/500)*255),((1-(reading.input1/500))*255),0,456);
    fill(random(0,255),12,12);
   // circle(width/2,height/2,reading.input1);

    stroke(((reading.input1/500)*255),((1-(reading.input1/500))*255),0);
    //curve(x1, y1, x2, y2, x3, y3, x4, y4)
    curve(timeT, reading.input1*18, (width/2)-300, height, (width/2)+300, height, width/2, reading.input1*18)
    //circle(timeT/50,(height/2)-reading.input1,10);
    //line(timeT/25,height, timeT/25, (height)-reading.input1);



    prevT = currentT;


    
}

// HELPER STUFF:

function windowResized() {
    resizeCanvas(windowWidth, windowHeight);
}

// DATA STUFF
function parseData(JSONload){
    reading = JSONload.values;
    console.log(reading);   
    // access individual inputs as reading.input{inputNumber}
}

function handleError(Err){
    console.log("An error was encountered: " + Err);
}
