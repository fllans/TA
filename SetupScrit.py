import os
import subprocess
import shutil
import zipfile
import win32api
import win32con
from zipfile import ZipFile
from datetime import datetime

# Директории
Branch = "main"
pathDistr = f"D:\\Distr\\{Branch}"
pathTmp = f"D:\\Distr\\{Branch}\\tmp"
pathSetup = f"D:\\_Scada_{Branch}"
typeSetup = "/FULL"


pathServerDistr = {'main': '\\\\devstorage.ivtek\\dev\\SCADAV\\main',                        
                   'develop': '\\\\devstorage.ivtek\\dev\\SCADAV\\develop',                        
                   '210': '\\\\devstorage.ivtek\\dev\\SCADA2\\branches\\Scada_2.10',                        
                   'trunk': '\\\\devstorage.ivtek\\dev\\SCADA2\\trunk',
                  }

componentDistrWin = {'main': 'ScadaSetupWin.zip',
                     'develop': 'ScadaSetupWin.zip',
                     '210': 'ScadaSetup.exe',
                     'trunk': 'ScadaSetup.exe'
                    }

componentDistrLin = {'main': 'ScadaSetup.tar.gz',
                     'develop': 'ScadaSetup.tar.gz'
                    }

listComponents = ['Redist/', 'about.txt', 'ScadaVSetup.exe']

listDb = {'AutoTestDb': '\\\\projectserver.ivtek\\QA_Proj\\QA\\AutoTestDb\\SCADABD.GDB',
          'AtV': '\\\\projectserver.ivtek\\QA_Proj\\QA\\AtV\\Tenix\\SCADABD.GDB'
          
          }

# Проверка и создание директори
if not os.path.exists(pathDistr):
    os.makedirs(pathDistr, exist_ok = True)
    os.makedirs(pathTmp, exist_ok = True)

# Функция проверки наличия локального дистрибутива
def LocalDistr(fileDistr):
    try:
        return os.path.exists(fileDistr)
    
    except Exception:
        print("LocalDistr: ошибка проверки наличия локального дистрибутива")

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
            print(f"DeleteOldestFolder: самая старая папка '{oldestFolder}' удалена")
        else:
            print(f"DeleteOldestFolder: в папке '{path}' нет папок")

    except Exception:
        print("DeleteOldestFolder: ошибка удаления папки с устаревшим backup'ом")

# Функция создания папки для Backup'а
def CreateBackupFolder(path):
    try:
        now = datetime.now()  # Теперь используем datetime.now()
        folderName = now.strftime("Backup_%Y-%m-%d_%H-%M-%S")
        folderPath = os.path.join(path, folderName)
        os.makedirs(folderPath)
        print(f"CreateBackupFolder: папка '{folderName}' успешно создана в '{path}'")
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
                print(f"СopyBackup: файл '{item}' скопирован")

        shutil.copytree(f"{pathSetup}\\DB", f"{pathBackup}\\DB")
        
        keysListDB = list(listDb.keys())
        for item in keysListDB:

            pathDb = f"{pathBackup}\\DB\\{item}"
            os.makedirs(pathDb, exist_ok=True)
            shutil.copy2(listDb[item], f"{pathDb}\\SCADABD.GDB")

        print("СopyBackup: копирования файлов для backup'а завершено")
        
    except Exception:
        print("СopyBackup: ошибка копирования файлов для backup'а")

# Функция проверки наличия и актуальнос актуального дистрибутива
def CheckDistr(path, component, local = True, filter = 100000):
    try:
        if local:
            pathComponent = f"{path}\\Distr\\{component}"
        else:
            pathComponent = f"{path}\\Distr\\{component}"

        if not os.path.exists(pathComponent) and local:
            print(f"CheckDistr: компонент '{pathComponent}' не найден на локальном компьютере")
            return True

        if not os.path.exists(pathComponent) and not local:
            print(f"CheckDistr: компонент '{pathComponent}' не найден на сервере")
            return False
        
        dataDistr = os.path.getmtime(pathComponent)
        now = datetime.now().timestamp()
        return dataDistr - now > filter

    except Exception:
        print("CheckDistr: ошибка проверки актуальности дистрибутива")

# Функция удаления файлов дистрибутива
def DelDistr(path, components):
    try:
        for item in components:
            pathComponent = f"{path}\\{item}"

            if os.path.exists(pathComponent):
                os.remove(pathComponent)
                print(f"DelDistr: компонент '{pathComponent}' удалён")

    except Exception:
        print("DelDistr: ошибка удаления дистрибутива")

# Функция копирования файлов дистрибутива
def CopyDistr(pathLocal, pathServer, componentWin, componentLin = ""):
    try:
        shutil.copy2(f"{pathServer}\\Distr\\{componentWin}", pathLocal)
        
        if componentLin != "":
            shutil.copy2(f"{pathServer}\\Distr\\{componentLin}", pathLocal)
    
    except Exception:
        print("CopyDistr: ошибка копирования дистрибутива с сервера")

# Функция извлечения файлов дистрибутива из архива
def ExtractDistr(path, zipName, extractName, redist = False):
    zipPath = f"{path}\\{zipName}"
    
    with zipfile.ZipFile(zipPath, 'r') as zipRef:
        for item in extractName:
            if os.path.exists(f"{path}\\{item}") or item != 'Redist/':
                try:
                    zipRef.getinfo(item)
                
                except Exception:
                    print(f"ExtractDistr: ошибка извлечения '{item}' из '{zipPath}'")

            zipRef.extractall(path, members = [item])
            print(f"ExtractDistr: файл или папка '{item}' успешно извлечён в '{path}'.")
    
    if not redist:
        if os.path.exists(f"{path}\\!Redist"):
            shutil.rmtree(f"{path}\\!Redist")
        os.rename(f"{path}\\Redist", f"{path}\\!Redist")

# Функция удаления предыдущей установки
def DelScada(path):
    try:
        if os.path.exists(path):
            shutil.rmtree(path)
        
        os.makedirs(path, exist_ok = True)
        print(f"DelScada: {path} успешно очищена")
        return True
    
    except Exception:
        print(f"DelScada: ошибка удаления установленной SCADA '{path}'. Ошибка: {Exception}")

# Функция запуска установки SCADA
def RunSetup(path, type, keys, extendedKeys = [""]):
    if os.path.exists(f"{path}\\ScadaSetup.exe"):
        fileSetup = f"{path}\\ScadaSetup.exe"
    elif os.path.exists(f"{path}\\ScadaVSetup.exe"):
        fileSetup = f"{path}\\ScadaVSetup.exe"
    else:
        print("RunSetup: файл установки не найден")
        return False
    
    keys = ["/S", f"{type}", f"/D={pathSetup}"]
    command = [fileSetup] + keys + extendedKeys

    try:
        print("RunSetup: процесс установки запущен")
        process = subprocess.Popen(
            command,
            creationflags = win32con.CREATE_NEW_CONSOLE | win32con.CREATE_NO_WINDOW | win32con.CREATE_UNICODE_ENVIRONMENT, 
            shell = True,
            startupinfo = startAdmin()
        )
        process.wait()

        if process.returncode == 0:
            print(f"RunSetup: приложение успешно установлено")
        else:
            print(f"RunSetup: ошибка при установке приложения. Код ошибки: {process.returncode}")
    
    except Exception:
        print(f"RunSetup: Ошибка при установке приложения: {Exception}")

def startAdmin():
    startupinfo = subprocess.STARTUPINFO()
    startupinfo.dwFlags = win32con.STARTF_USESHOWWINDOW
    startupinfo.wShowWindow = win32con.SW_HIDE
    return startupinfo

def SetupScada():
    
    
    
    
    
    return
















# Тест 
СopyBackup(pathDistr, pathTmp, pathSetup)
# ActualDistr(pathDistr, pathServerDistr[Branch], componentDistrWin[Branch], 100000)

CheckDistr(pathServerDistr[Branch], componentDistrWin[Branch], False)
CheckDistr(pathDistr, componentDistrWin[Branch])
DelDistr(pathDistr, listComponents)
CopyDistr(pathDistr, pathServerDistr[Branch], componentDistrWin[Branch], componentDistrLin[Branch])
ExtractDistr(pathDistr, componentDistrWin[Branch], listComponents)
DelScada(pathSetup)
RunSetup(pathDistr, typeSetup, pathSetup)

def MakeBackup(pathDistr):
    # while CountFolders(f"{pathDistr}\\tmp") > 10:
    #     DeleteOldestFolder(f"{pathDistr}\\tmp\\")
    # CreateBackupFolder(f"{pathDistr}\\tmp")
    # os.makedirs(f"{pathDistr}\\tmp\\", exist_ok=True)
    
    
    return True


# Пример использования















# Функция настройки окружения
def copyComponents(directory, branch):
    if branch == "main":
        os.rename(f'{pathSetup}\\DB\\Demo', 'Demo_orig')
        shutil.copy2(f'{listDb["AtV"]}', f'{pathSetup}\\DB\\Demo\\')
    
    return True

# Функция установки SCADA
def SetupScada (directoryDistr, Branch):
    # Копирование дистрибутива и бинарей
    # if ActualDistr(directoryDistr, Branch, 100000):
        print(f"Сервер содержит более свежую версию дистрибутива. Старые версии будут удалены с локального ПК")
        # directoryDistr = "D:\\fsdfsd\\4234234\\"
        # delDistr(directoryDistr, Branch)
        # copyDistr(directoryDistr, Branch, True)

    
# Копирование файлов SCADA
# if actualDistr(pathDistr, Branch, 100000):
#     print(f"Сервер содержит более свежую версию дистрибутива. Старые версии будут удалены с локального ПК")
# #     pathDistr = "D:\\fsdfsd\\4234234\\"
#     delDistr(pathDistr, Branch)
#     copyDistr(pathDistr, Branch, True)

def setupScada(directory, distr, branch):
    if LocalDistr(f"{directory}\\{distr[f"{branch}_distr"]}"):
        # delDistr(pathDistr, Branch)
        # copyDistr(pathDistr, Branch, True)
    
    
    # if ActualDistr(pathDistr, Branch, 100000):
        print(f"Сервер содержит более свежую версию дистрибутива. Старые версии будут удалены с локального ПК")
    return False
    






    # # Удаление неактуальных дистрибутивов
    # for root, dirs, files in os.walk(directoryDistr):
    #     for filename in files:
            
    #         fullpath = os.path.join(root, filename)
            
    #         if os.path.isfile(fullpath) and filename.endswith("Setup.tar.gz"):
    #             os.remove(fullpath)
    #             print(f"Файл дистрибутива '{directoryDistr}\\ScadaSetup.tar.gz' удалён")
            
    #         if os.path.isfile(fullpath) and filename.endswith("SetupWin.zip"):
    #             os.remove(fullpath)
    #             print(f"Файл дистрибутива '{directoryDistr}\\ScadaSetupWin.zip' удалён")
    
    # Копирование актуальных дистрибутивов с сервера
