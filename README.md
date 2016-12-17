## Mazemap Pathfinder
Mazemap allows you to search for a shortest path in the given 2D map(check tmp/maze.txt for examples)  

Mazemap has built-in command line tool  
So after the gem installation you can just type  
`bundle exec mazemap maze.txt`  
to execute a search  

#### Usage
Gemfile  
`gem 'mazemap', github: 'leafmind/mazemap'`  

`bundle install`  

In your code:  
`Mazemap.read_and_search(filename)`  

Also you can use mazemap command line tool:  
`bundle exec mazemap maze.txt`  

#### Maze file format example

```
******************************************
*               ******            ***    *
*   ***   ***   ******      * B   ***    *
*   ***   ***   ******     ***           *
*   ***                   *****   ***    *
*   *********             *****   ***    *
*   *******      ****      ***    ***    *
*               ******                   *
*     ***        ****       **********   *
*     ***                  ***********   *
*     *******             ************   *
*     *******    ****                    *
*      A         ****               ******
******************************************
```


Known issues on MAC OS X  
https://github.com/SciRuby/nmatrix/issues/426  

Workaround  
https://github.com/SciRuby/nmatrix/issues/426#issuecomment-218122512

