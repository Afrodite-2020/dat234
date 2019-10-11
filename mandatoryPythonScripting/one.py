import requests
import re


def task_1():
    # the required first parameter of the 'get' method is the 'url':
    x = requests.get('https://links.datapor.no/')

    # print the response text (the content of the requested file):
    print(x.text)


def task_2():
    req = requests.get('https://links.datapor.no/')
    srcC = req.text
    strr = str(srcC)

    httpCount = re.findall("http:", strr)
    httpsCount = re.findall("https:", strr)

    print("http links: " + str(len(httpCount)))
    print("https links: " + str(len(httpsCount)))


def task_3():
    req = requests.get('https://links.datapor.no/')
    srcC = req.text
    strr = str(srcC)
    urls = re.findall('https?://(?:[-\w.]|(?:%[\da-fA-F]{2}))+', strr)
    tlds = set()

    for links in urls:
       links = re.split("[.]", links)
       tlds.add(links[-1])
    print(tlds)

def task_4():
    req = requests.get('https://links.datapor.no/')
    srcC = req.text
    strr = str(srcC)
    urls = re.findall('https?:\/\/www[.][a-zA-Z0-9]*[.]|https?:\/\/[a-zA-Z0-9]*[.]|www.[a-zA-Z0-9]*[.]', strr)

    hostnames = set()

    for links in urls:

        links = re.split("[.|/]", links)
        hostnames.add(links[-2])

    print(hostnames)

def task_5():
    req = requests.get('https://links.datapor.no/')
    srcC = req.text
    strr = str(srcC)
    tags = re.findall('[<][a-zA-Z0-9]+[\s]|[<][a-zA-Z0-9]+[>]', strr)

    htmlTags = set()

    for t in tags:
        t = re.split("[<|>]", t)
        htmlTags.add(t[1])

    print(htmlTags)

def task_6():
    req = requests.get('https://links.datapor.no')
    srcC = req.text
    strr = str(srcC)

    links = (re.findall(r'a href=[\'"]?([^\'" >]+)', strr))
    i = 1

    for x in range(len(links)):
        get = requests.get(links[x])
        sc = get.text
        titleSearch = re.search('<title[^>]*>\s*((?:.|\n)*?)</title>', sc, re.IGNORECASE)
        if titleSearch:
            title = titleSearch.group(1)
            print(str(x+1)+": "+ links[x] + "\n" + "\t" + title + "\n")
        else:
            print(str(x+1)+': ERROR - UNABLE TO FETCH TITLE (UNAUTHORIZED?)')

if __name__ == "__main__":
    task_1()
    task_2()
    task_3()
    task_4()
    task_5()
    task_6()
