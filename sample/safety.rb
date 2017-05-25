require "ult"
extend Ult

p safety{
  dir( ".." ){
    xyz
  }
}

p safety{
  dir( ".." ){
    exit 1
  }
}.status
