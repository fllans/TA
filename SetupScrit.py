import os
import shutil
import zipfile
from zipfile import ZipFile
from datetime import datetime

# Директории
Branch = "main"
directoryDistr = f"C:/Users/zaycevds/Documents/Distr/{Branch}"
directorySetup = f"C:/SCADA/_Scada_{Branch}"

directoryServerDistr = {'main': '//devstorage.ivtek/dev/SCADAV/main/',
                        'main_distr': 'ScadaSetupWin.zip',
                        'main_distrLin': 'ScadaSetup.tar.gz',
                        'main_exe': 'ScadaVSetup.exe',
                        
                        'develop': '//devstorage.ivtek/dev/SCADAV/develop/',
                        'develop_distr': 'ScadaSetupWin.zip',
                        'develop_distrLin': 'ScadaSetup.tar.gz',
                        'develop_exe': 'ScadaVSetup.exe',
                        
                        '210': '//devstorage.ivtek/dev/SCADA2/branches/Scada_2.10/',
                        '210_distr': 'ScadaSetup.exe',
                        
                        'trunk': '//devstorage.ivtek/dev/SCADA2/trunk/',
                        'trunk_distr': 'ScadaSetup.exe'
                       }

listDb = {'AutoTestDb': '//projectserver.ivtek/QA_Proj/QA/AtV/Tenix/SCADABD.GDB',
          'AtV': '//projectserver.ivtek/QA_Proj/QA/AtV/Tenix/SCADABD.GDB'
          
          }


# Функция создание иерархии папок

# Функция проверки актуальности локальных дистрибутивов
def actualDistr(directory, branch, filter):
    if branch == "main" or "develop":  
        dataDistrLocal = os.path.getmtime(f"{directory}/ScadaSetupWin.zip")
        dataDistr = os.path.getmtime(f"{directoryServerDistr[f"{branch}"]}Distr/{directoryServerDistr[f"{branch}_distr"]}")
    return dataDistr - dataDistrLocal > filter

# Функция удаления дистрибутивов
def delDistr(directory, branch):
    for root, dirs, files in os.walk(directory):
        for filename in files:        
            fullpath = os.path.join(root, filename)          
            if os.path.isfile(fullpath) and filename.endswith("ScadaSetup.tar.gz"):
                os.remove(fullpath)
                print(f"Файл дистрибутива '{directoryDistr}{directoryServerDistr[f"{branch}_distrLin"]}' удалён")            
            if os.path.isfile(fullpath) and filename.endswith("ScadaSetupWin.zip"):
                os.remove(fullpath)
                print(f"Файл дистрибутива '{directoryDistr}{directoryServerDistr[f"{branch}_distr"]}' удалён")
            if os.path.isfile(fullpath) and filename.endswith("ScadaVSetup.exe"):
                os.remove(fullpath)
                print(f"Файл дистрибутива '{directoryDistr}{directoryServerDistr[f"{branch}_distr"]}' удалён")
            if os.path.isfile(fullpath) and filename.endswith("ScadaSetup.exe"):
                os.remove(fullpath)
                print(f"Файл дистрибутива '{directoryDistr}{directoryServerDistr[f"{branch}_exe"]}' удалён")
    return True

# Функция копирования дистрибутивов и бинарей с сервера
def copyDistr (directory, branch, distr):
    if distr:
        shutil.copy2(f'{directoryServerDistr[f"{branch}"]}Distr/{directoryServerDistr[f"{branch}_distr"]}', f'{directory}/')
        if not os.path.isfile(f'{directory}/{directoryServerDistr[f"{branch}_distr"]}'):
            print(f"Файл '{directoryServerDistr[f"{branch}_distr"]}' не скопирован. Выполнение программы остановлено")
            exit()
        
        if branch == "210":
            shutil.copy2(f'{directoryServerDistr[f"{branch}"]}Distr/Redist', f'{directory}/')
        
        if branch == "main" or "develop":
            with ZipFile(f"{directoryDistr}{directoryServerDistr[f"{branch}_distr"]}", "r") as myzip:
                myzip.extractall(f"{directoryDistr}")
                print(f"Файлы извлечены из архива '{directoryServerDistr[f"{branch}_distr"]}'")
                
                if not os.path.isfile(f'{directory}/{directoryServerDistr[f"{branch}_distr"]}'):
                    print(f"Файл '{directoryServerDistr[f"{branch}_exe"]}' не найден. Выполнение программы остановлено")
                    exit()
            
            shutil.copy2(f'{directoryServerDistr[f"{branch}"]}Distr/{directoryServerDistr[f"{branch}_distrLin"]}', f'{directory}/')        
            if not os.path.isfile(f'{directory}/{directoryServerDistr[f"{branch}_distrLin"]}'):
                print(f"Файл '{directoryServerDistr[f"{branch}_distrLin"]}' не скопирован. Выполнение программы остановлено")
                exit()
        
        print("Файлы дистрибутивов скопированы на локальный ПК")
    if not distr:
        # не реализовано
        print("Бинари скопированы на локальный ПК")
    
    if not actualDistr(directoryDistr, Branch, 100000):
        print(f"Локальная версия дистрибутива не отличается от сетевой")
    else: exit("Ошибка обновления дистрибутива. Выполнение программы остановлено")
    
    return True

# Функция настройки окружения
def copyComponents(directory, branch):
    if branch == "main":
        os.rename(f'{directorySetup}/DB/Demo', 'Demo_orig')
        shutil.copy2(f'{listDb["AtV"]}', f'{directorySetup}/DB/Demo/')
    
    return True

# Функция установки SCADA
def SetupScada (directoryDistr, Branch):
    # Копирование дистрибутива и бинарей
    if actualDistr(directoryDistr, Branch, 100000):
        print(f"Сервер содержит более свежую версию дистрибутива. Старые версии будут удалены с локального ПК")
        directoryDistr = "D:/fsdfsd/4234234/"
        delDistr(directoryDistr, Branch)
        copyDistr(directoryDistr, Branch, True)

    
# Копирование файлов SCADA
if actualDistr(directoryDistr, Branch, 100000):
    print(f"Сервер содержит более свежую версию дистрибутива. Старые версии будут удалены с локального ПК")
    directoryDistr = "D:/fsdfsd/4234234/"
    delDistr(directoryDistr, Branch)
    copyDistr(directoryDistr, Branch, True)








    # # Удаление неактуальных дистрибутивов
    # for root, dirs, files in os.walk(directoryDistr):
    #     for filename in files:
            
    #         fullpath = os.path.join(root, filename)
            
    #         if os.path.isfile(fullpath) and filename.endswith("Setup.tar.gz"):
    #             os.remove(fullpath)
    #             print(f"Файл дистрибутива '{directoryDistr}/ScadaSetup.tar.gz' удалён")
            
    #         if os.path.isfile(fullpath) and filename.endswith("SetupWin.zip"):
    #             os.remove(fullpath)
    #             print(f"Файл дистрибутива '{directoryDistr}/ScadaSetupWin.zip' удалён")
    
    # Копирование актуальных дистрибутивов с сервера
