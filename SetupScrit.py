import os
import shutil
import zipfile
from zipfile import ZipFile
from datetime import datetime

# Директории
Branch = "main"
pathDistr = f"D:/Distr/{Branch}"
pathTmp = f"D:/Distr/{Branch}/tmp"
pathSetup = f"D:/_Scada_{Branch}"

directoryServerDistr = {'main': '//devstorage.ivtek/dev/SCADAV/main/',                        
                        'develop': '//devstorage.ivtek/dev/SCADAV/develop/',                        
                        '210': '//devstorage.ivtek/dev/SCADA2/branches/Scada_2.10/',                        
                        'trunk': '//devstorage.ivtek/dev/SCADA2/trunk/',
                       }

componentDistrWin = {'main': 'ScadaSetupWin.zip',
                     'develop': 'ScadaSetupWin.zip',
                     '210': 'ScadaSetup.exe',
                     'trunk': 'ScadaSetup.exe'
                    }

listDb = {'AutoTestDb': '//projectserver.ivtek/QA_Proj/QA/AutoTestDb/SCADABD.GDB',
          'AtV': '//projectserver.ivtek/QA_Proj/QA/AtV/Tenix/SCADABD.GDB'
          
          }

# Проверка и создание директори
if not os.path.exists(pathDistr):
    os.makedirs(pathDistr, exist_ok=True)
    os.makedirs(pathTmp, exist_ok=True)

# Функция проверки наличия локального дистрибутива
def LocalDistr(fileDistr):
    try:
        return os.path.exists(fileDistr)
    
    except Exception:
        print("LocalDistr: ошибка проверки наличия локального дистрибутива")

# Функция проверки актуальности локального дистрибутива
# переделать на прверку определённых фалов
def ActualDistr(directoryLocal, directoryServer, component, filter):
    try:
        dataDistrLocal = os.path.getmtime(f"{directoryLocal}/{component}")
        dataDistr = os.path.getmtime(f"{directoryServer}/{component}")
        return dataDistr - dataDistrLocal > filter

    except Exception:
        print("ActualDistr: ошибка проверки актуальности дистрибутива")

# Функция подсчёта количества папок
def CountFolders(path):
    try:
        count = 0
        for item in os.listdir(path):
            itemPath = os.path.join(path, item)
        
            if os.path.isdir(itemPath):
                count += 1
        return count
    
    except Exception:
        print("CountFolders: ошибка подсчёта количества папок")

# Функция удаления самой старой папки
def DeleteOldestFolder(path):
    try:
        oldestFolder = None
        oldestTime = float('inf')

        for item in os.listdir(path):
            itemPath = os.path.join(path, item)
        
            if os.path.isdir(itemPath):
                modifiedTime = os.path.getmtime(itemPath)
        
                if modifiedTime < oldestTime:
                    oldestTime = modifiedTime
                    oldestFolder = itemPath

        if oldestFolder:
            shutil.rmtree(oldestFolder)
            print(f"Самая старая папка '{oldestFolder}' удалена")
        else:
            print(f"В папке '{path}' нет папок")

    except Exception:
        print("DeleteOldestFolder: ошибка удаления папки с устаревшим backup'ом")

# Функция создания папки для Backup'а
def CreateBackupFolder(path):
    try:
        now = datetime.now()  # Теперь используем datetime.now()
        folderName = now.strftime("Backup_%Y-%m-%d_%H-%M-%S")
        folderPath = os.path.join(path, folderName)
        os.makedirs(folderPath)
        print(f"Папка '{folderName}' успешно создана в '{path}'")
        return folderPath
    
    except Exception:
        print("CreateBackupFolder: ошибка создания папки для backup'а")

# Функция копирования файлов для backup'а
def СopyBackup(pathDistr, pathTmp, pathSetup):
    try:
        while CountFolders(pathTmp) >= 10:
            DeleteOldestFolder(pathTmp)

        pathBackup = CreateBackupFolder(pathTmp)

        for item in os.listdir(pathDistr):
            pathSource = os.path.join(pathDistr, item)

            if os.path.isfile(pathSource):
                shutil.copy2(pathSource, pathBackup)
                print(f"Файл '{item}' скопирован")

        shutil.copytree(f"{pathSetup}/DB", f"{pathBackup}/DB")
        
        keysListDB = list(listDb.keys())
        for item in keysListDB:

            pathDb = f"{pathBackup}/DB/{item}"
            os.makedirs(pathDb, exist_ok=True)
            shutil.copy2(listDb[item], f"{pathDb}/SCADABD.GDB")

        print("Копирования файлов для backup'а завершено")
        
    except Exception:
        print("СopyBackup: ошибка копирования файлов для backup'а")




# Тест 
СopyBackup(pathDistr, pathTmp, pathSetup)







def MakeBackup(pathDistr):
    # while CountFolders(f"{pathDistr}/tmp") > 10:
    #     DeleteOldestFolder(f"{pathDistr}/tmp/")
    # CreateBackupFolder(f"{pathDistr}/tmp")
    # os.makedirs(f"{pathDistr}/tmp/", exist_ok=True)
    
    
    return True


# Пример использования










def DeletePath(directory):
    for filename in os.listdir(directory):
        file_path = os.path.join(directory, filename)
        try:
            if os.path.isfile(file_path):
                os.remove(file_path)
        except Exception as e:
            print(f'Ошибка при удалении файла {file_path}. {e}')






def delete_everything_in_folder(folder_path):
    shutil.rmtree(folder_path)
    os.mkdir(folder_path)








# Резервное копирование дистрибутива
def BackupDistr(directory, component):
    
    return True





# Функция удаления дистрибутивов
def delDistr(directory, branch):
    for root, dirs, files in os.walk(directory):
        for filename in files:        
            fullpath = os.path.join(root, filename)          
            if os.path.isfile(fullpath) and filename.endswith("ScadaSetup.tar.gz"):
                os.remove(fullpath)
                print(f"Файл дистрибутива '{pathDistr}{directoryServerDistr[f"{branch}_distrLin"]}' удалён")            
            if os.path.isfile(fullpath) and filename.endswith("ScadaSetupWin.zip"):
                os.remove(fullpath)
                print(f"Файл дистрибутива '{pathDistr}{directoryServerDistr[f"{branch}_distr"]}' удалён")
            if os.path.isfile(fullpath) and filename.endswith("ScadaVSetup.exe"):
                os.remove(fullpath)
                print(f"Файл дистрибутива '{pathDistr}{directoryServerDistr[f"{branch}_distr"]}' удалён")
            if os.path.isfile(fullpath) and filename.endswith("ScadaSetup.exe"):
                os.remove(fullpath)
                print(f"Файл дистрибутива '{pathDistr}{directoryServerDistr[f"{branch}_exe"]}' удалён")
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
            with ZipFile(f"{pathDistr}{directoryServerDistr[f"{branch}_distr"]}", "r") as myzip:
                myzip.extractall(f"{pathDistr}")
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
    
    if not ActualDistr(pathDistr, Branch, 100000):
        print(f"Локальная версия дистрибутива не отличается от сетевой")
    else: exit("Ошибка обновления дистрибутива. Выполнение программы остановлено")
    
    return True

# Функция настройки окружения
def copyComponents(directory, branch):
    if branch == "main":
        os.rename(f'{pathSetup}/DB/Demo', 'Demo_orig')
        shutil.copy2(f'{listDb["AtV"]}', f'{pathSetup}/DB/Demo/')
    
    return True

# Функция установки SCADA
def SetupScada (directoryDistr, Branch):
    # Копирование дистрибутива и бинарей
    if ActualDistr(directoryDistr, Branch, 100000):
        print(f"Сервер содержит более свежую версию дистрибутива. Старые версии будут удалены с локального ПК")
        # directoryDistr = "D:/fsdfsd/4234234/"
        # delDistr(directoryDistr, Branch)
        # copyDistr(directoryDistr, Branch, True)

    
# Копирование файлов SCADA
# if actualDistr(pathDistr, Branch, 100000):
#     print(f"Сервер содержит более свежую версию дистрибутива. Старые версии будут удалены с локального ПК")
# #     pathDistr = "D:/fsdfsd/4234234/"
#     delDistr(pathDistr, Branch)
#     copyDistr(pathDistr, Branch, True)

def setupScada(directory, distr, branch):
    if LocalDistr(f"{directory}/{distr[f"{branch}_distr"]}"):
        delDistr(pathDistr, Branch)
        copyDistr(pathDistr, Branch, True)
    
    
    if ActualDistr(pathDistr, Branch, 100000):
        print(f"Сервер содержит более свежую версию дистрибутива. Старые версии будут удалены с локального ПК")
    return False
    






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
