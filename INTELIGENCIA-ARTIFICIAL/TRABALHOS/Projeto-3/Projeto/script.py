# -*- coding: utf-8 -*-
from sklearn.neural_network import MLPClassifier

inputs = []
outputs = []
letter_outputs = []
inputs.append([])
outputs.append([])
letter_outputs.append([])

letter_recognition = open("dataset/letter-recognition.data", "r")
letter_recognition = letter_recognition.readlines()
letter_convert = open("dataset/letter-convert.data", "r")
letter_convert = letter_convert.readlines()
# 16 parametros inputs
# 1 parametro saida
dataset_separator = 0
indicates_next_dataset = 0
for letter_recognition_line in letter_recognition:
    letter_recognition_line = letter_recognition_line.replace("\n", "").split(",")
    if dataset_separator < 2000:
        inputs[indicates_next_dataset].append(list(map(int, letter_recognition_line[1:15])))
        
        for letter_convert_line in letter_convert:
            letter_convert_line = letter_convert_line.replace("\n", "").split(",")
            if letter_convert_line[0] == letter_recognition_line[0]:
                outputs[indicates_next_dataset].append([int(letter_convert_line[1])])
                letter_outputs[indicates_next_dataset].append([letter_convert_line[0]])
                break    
        dataset_separator +=1
    else:
        inputs.append([])
        outputs.append([])
        letter_outputs.append([])
        dataset_separator = 0
        indicates_next_dataset += 1
    
# print('inputs: ' + str(inputs) + '\n' + 'numero inputs' + str(len(inputs)) + '\n'+ 'outputs: ' + str(outputs) + '\n' + 'numero outputs' + str(len(outputs)))
print("\n")
# print(outputs)
print('inputs[0]: ' + str(inputs[0]) + '\n' + 'numero inputs[0]: ' + str(len(inputs[0])) + '\n'+ 'outputs[0]: ' + str(outputs[0]) + '\n' + 'numero outputs[0]: ' + str(len(outputs[0])))
print("\n")

redeNeural = MLPClassifier(verbose=(True), 
                           max_iter=1000,
                           tol=0.001,
                           activation='logistic',
                           learning_rate_init=0.1,
                           solver='sgd') #cria a RNA
#verbose mostra o erro gerado pela RNA
#max_iter é o número máximo de épocas
#tol é a tolerância
# activation é a função de ativação
#learning_rate_init=0.3 é a taxa de aprendizagem
#Solver é o algoritmo utilizado para atualização dos pesos
redeNeural.fit(inputs[0], outputs[0]) #Treinamento da RNA

hits = 0 #erros
hits_all = 0
misses = 0 #acertos
misses_all = 0
for input_list_number in range(len(inputs)):
    if input_list_number > 0:
        for input_number in range(len(inputs[input_list_number])):
            output_predict = redeNeural.predict([inputs[input_list_number][input_number]]) #fazer a previsão

            for letter_convert_line in letter_convert:
                letter_convert_line = letter_convert_line.split(",")
                if int(letter_convert_line[1]) == int(output_predict[0]):
                    output_predict = letter_convert_line[0]
                    break 
            if str(letter_outputs[input_list_number][input_number][0]) == str(output_predict):
                hits +=1
            else:
                misses += 1
        print("\n==========")
        print("Total analisado no conjunto: "+ str(hits + misses))
        print("Resultado conjunto " + str(input_list_number) + ": " + str(hits) + " acertos e " + str(misses) + " erros")
        porcentage_hits = (hits/len(inputs[input_list_number]))*100
        porcentage_misses = (misses/len(inputs[input_list_number]))*100
        print("Porcentagem de acertos: " + str(porcentage_hits) + "%" + "\nPorcentagem de erros: " + str(porcentage_misses) + "%")
        print("==========")
        hits_all += hits
        misses_all += misses
        hits = 0
        misses = 0

print("\n==========")
print("Total analisado: "+ str(hits_all + misses_all))
print("Resultado geral: " + str(hits_all) + " acertos e " + str(misses_all) + " erros")
porcentage_hits = (hits_all/len(inputs))*100
porcentage_misses = (misses_all/len(inputs))*100
print("Porcentagem de acertos: " + str(porcentage_hits) + "%" + "\nPorcentagem de erros: " + str(porcentage_misses) + "%")
print("==========\n")
