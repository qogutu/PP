// std::lock example
#include <iostream>       // std::cout
#include <thread>         // std::thread
#include <mutex>          // std::mutex, std::lock

std::mutex foo;
int totalvotes = 0;
int votes1 = 0;
int votes2 = 0;


void task_a () {
  while(totalvotes < 200000) {
   foo.lock();
   totalvotes++;
   votes1++;
   foo.unlock();
  }
}

void task_b () {
  while(totalvotes < 200000) {
   foo.lock();
   totalvotes++;
   votes2++;
   foo.unlock();
  }
}

int main ()
{
  std::thread th1 (task_a);
  std::thread th2 (task_b);

  th1.join();
  th2.join();
std::cout<<votes1<<"\n";
  std::cout<<votes2<<"\n";
  std::cout<<totalvotes;
  return 0;
}