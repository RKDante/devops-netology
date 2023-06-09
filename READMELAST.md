Задание 1
$ git show aefead2207
commit aefead2207ef7e2aa5dc81a34aedf0cad4c32545
Author: Alisdair McDiarmid <alisdair@users.noreply.github.com>
Date:   Thu Jun 18 10:29:58 2020 -0400

   Update CHANGELOG.md

Задание 2
1. $ git tag --points-at 85024d3
Коммиту 85024d3 соответствует тег v0.12.23

2. $ git show b8d720^@
2 родителя: 56cd7859e05c36c06b56d013b55a252d0bb7e158  9ea88f22fc6269854151c571162c5bcf958bee2b

3. $ git log v0.12.23..v0.12.24
33ff1c03bb960b332be3af2e333462dde88b279e (tag: v0.12.24) v0.12.24
b14b74c4939dcab573326f4e3ee2a62e23e12f89 [Website] vmc provider links
3f235065b9347a758efadc92295b540ee0a5e26e Update CHANGELOG.md
6ae64e247b332925b872447e9ce869657281c2bf registry: Fix panic when server is unreachable
5c619ca1baf2e21a155fcdb4c264cc9e24a2a353 website: Remove links to the getting started guide's old location
06275647e2b53d97d4f0a19a0fec11f6d69820b5 Update CHANGELOG.md
d5f9411f5108260320064349b757f55c09bc4b80 command: Fix bug when using terraform login on Windows
4b6d06cc5dcb78af637bbb19c198faff37a066ed Update CHANGELOG.md
dd01a35078f040ca984cdd349f18d0b67e486c35 Update CHANGELOG.md
225466bc3e5f35baa5d07197bbc079345b77525e Cleanup after v0.12.23 release

4. $ git log -S"func synchronizedWriters(" --pretty=oneline
commit 5af1e6234ab6da412fb8637393c5a17a1b293663
Другой коммит нам не подходит, так как в нем просто ремувнули данную функцию за ее ненадобность.

5. git grep -p "globalPluginDirs("
Тут мы нашли 2 файла, где есть эта функция

$ git log -L :globalPluginDirs:plugins.go
commit 8364383c359a6b738a436d1b7745ccdce178df47
commit c0b17610965450a89598da491ce9b6b5cbd6393f
commit 35a058fb3ddfae9cfee0b3893822c9a95b920f4c

6. $ git log -S"func synchronizedWriters(" --pretty=format:"%h - %an, %ar : %s"
bdfea50cc8 - James Bardin, 2 years, 6 months ago : remove unused
5ac311e2a9 - Martin Atkins, 6 years ago : main: synchronize writes to VT100-faker on Windows
