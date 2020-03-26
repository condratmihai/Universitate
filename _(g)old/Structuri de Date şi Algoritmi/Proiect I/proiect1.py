#Proiect SDA: Condrat Mihai, Guiţă Oana, Mihalea Andreas (Grupa 211).
#problema3.py

from random import randint
from problem import Problem
     
def numar(x,stack):
     stack.append(x) #O(n)
 
def p_type(arr,stack):
     arr.append(stack.pop()) #O(n)
     

def p1(stack,x,vec):
     vec.append(stack.pop(x))
 
class Problem3(Problem):
    def __init__(self):
        statement = '3. Primiti o stiva. Operatii: \n'
        statement += 'numar -> se inseaza numarul in stiva \n'
        statement += 'P -> se extrage un numar din stiva si se afiseaza \n'
        statement += 'Introduceti in stiva urmatoarele numere: ' 
        data=[]
        self.temp2=[]
        n = self.n = randint(3, 20)
        for i in range (1, n):
               ktemp = randint(1, 99)
               data.append(ktemp)
               self.temp2.append(ktemp)
        temp = data
        i=1
        n = len(data);
        if n <= 3:
               self.k=randint(1,3)
        else:
               self.k=randint(int(n/3), n-3)
        contor = self.k
        vec=[]
        while i < n:
                  p1(temp,contor,vec)
                  if i < self.k:
                      contor = contor - 1
                  i = i + 1
        contor = contor - 1      
        p1(temp,contor,vec)
        k = self.k
        statement += str(self.temp2) + ' pentru care avem raportul: \n' + str(int(k/n*100)) + '% si ' + str(int((n-k)/n*100)) + '% \n'    
        statement += 'Determinati operatiile pentru care se afiseaza: '
        statement += str(vec)
        statement += "\n"
        super().__init__(statement, data)
       
    def solve(self):
          data = self.temp2
          n = self.n - 1
          stack = []
          arr = []
          i = ok = 0
          contor = 1
          k = self.k
          solution ='Operatiile folosite sunt: \n'
          solution += '['
          while i <= n:
                      if i <= k:
                            if ok == 0:
                                   e = data[i]
                                   numar(e,stack)
                                   solution += 'numar(' + str(e) + '), '
                                   if i == k:
                                              ok = 1
                                              i = 1
                                   else:
                                        i = i + 1
                                        contor = contor + 1
                                       
                            elif contor-i != 0:
                                    solution += 'p, '
                                    p_type(arr,stack)
                                    i = i + 1
                                    contor = contor - 1
                                       
                            if ok == 1 & contor == 1:
                                    contor = k + 1
                                   
                      else:
                            if contor == n:
                                break
                            e = data[contor]
                            numar(e,stack)
                            solution += 'numar('+str(e)+'), ' + 'p, '
                            p_type(arr,stack)
                            contor = contor + 1
                            i = i + 1
                               
          solution += 'p]'   
          p_type(arr,stack)
          return solution
