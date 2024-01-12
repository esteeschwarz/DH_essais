//fn main() {
//    println!("Hello, world!");
//}

//use std::io::{self, Read};
use std::io::{self, stdout, Read};
use termion::raw::IntoRawMode;
fn to_ctrl_byte(c: char) -> u8 {
  let byte = c as u8;
 // byte & 0b10101011 //alt-q
  byte & 0b0001_1111
}
fn die(e: std::io::Error){
  panic!(e);
}
fn main() {
let _stdout = stdout().into_raw_mode().unwrap();
  for b in io::stdin().bytes(){
   // let c=b.unwrap() as char;
  //  println!("{}",c);
  //  let b = b.unwrap();
  //  let c = b as char;
  //  if c.is_control(){
  //  println!("{:?} \r",b);
    //} else {
  //  println!("{:?} ({})\r",b,c);
  //  println!("{:#b}({})\r",b,c);
  //  }
    //if c =='q'{
  //  if b==to_ctrl_byte('c') {
  //  break;
      
  //  }
    match b{
    Ok(b)=>{
      let c = b as char;
        if c.is_control(){
    println!("{:?} \r",b);
    } else {
    println!("{:?} ({})\r",b,c);
    println!("{:#b}({})\r",b,c);
    }
    if b==to_ctrl_byte('c') {
    break;
      
    }
    }
    Err(err) => die(err)
  }
}
}