#include <fstream>
#include <iostream>
#include <sstream>
#include <string>
std::string read_file(const std::string &filepath) {
  std::ifstream file(filepath);
  std::stringstream buffer;
  buffer << file.rdbuf();
  return buffer.str();
}
int main() {
  std::string content = read_file("showoff.text");
  std::cout << content;
  //
}
