# Ruby技術者認定試験  まとめ

1. String#index
    - 探したい文字列パターンと検索開始位置を指定し、最初に見つかった部分文字列のインデックス番号を返す。
    ```
    p "hello!hello!hello!".index("!", 6)
    #=> 11
    検索開始位置は2番目の"h"
    ```

1. String#char
    - chr
        - selfの最初の文字だけを含む文字列を返す
    ```
    a = "abcde"
    a.chr
    #=> "a"
    ```

    - ord
        - 文字列の最初の文字の文字コードを整数で返す
    ```
    p "a".ord   # => 97
    ```

1. String#chars
    - 文字列の各文字を文字列の**配列**で返す
    ```
    "hello世界".chars # => ["h", "e", "l", "l", "o", "世", "界"]
    ```

1. String#delete
    - 引数の値を取り除いだ文字列を生成して返す
    ```
    puts "0120-456-789".delete("^0-58-")
    => 0120-45-8
    ```

1. String#upcase
    - 全ての小文字を対応する大文字に置き換えた文字列を返す
    - **非破壊的メソッド**なので注意
    ```
    p "hello".upcase   # => "HELLO"
    ```

1. String#upto
    - selfから始めて、引数までの文字列を返す。
    ```
    "aa".upto("ae") {|s| print s, ',' }
    => aa,ab,ac,ad,ae
    ```

1. String#eql?
    - 文字列の値が等しいときにtrueを返す。
    - equal?メソッドは等しいオブジェクトの時、trueを返す。
    ```
    a = "abc"
    b = "abc"
    print a.eql? b #=> true　値は同じなのでtrue
    print a.equal? b #=> false 値は同じだが、異なるオブジェクトなのでfalse
    print a == b #=> true 値は同じなのでtrue(eql?と同様)
    ```

1. String#chop, chomp
    - chop///文字列の最後の文字を取り除いた新しい文字列を生成して返す。末尾が改行文字("\r\n")であればその2文字を取り除く。
    ```
    p "string\n".chop    # => "string"
    p "string\r\n".chop  # => "string"
    p "string".chop      # => "strin"
    p "strin".chop       # => "stri"
    p "".chop            # => ""
   
    ひっかけ問題・・・chopは破壊的メソッドではない
    music = "Jazz\nRock\rTechno\n\r!"
    music.chop
    p music
    => "Jazz\nRock\rTechno\n\r!"
    ```
    - chomp///末尾から引数で指定する改行コードを取り除いた文字列を生成して返す。ただし引数が"\n"のときは、実行環境によらず"\r", "\r\n", "\n"のすべてを改行コードとみなして取り除く。
    ```
    p "foo\n".chomp             # => "foo"
    p "foo\n".chomp("\n")       # => "foo"
    p "foo\r\n".chomp("\r\n")   # => "foo"
    
    $/ = "\n"   # デフォルト値と同じ
    p "foo\r".chomp    # => "foo"
    p "foo\r\n".chomp  # => "foo"
    p "foo\n".chomp    # => "foo"
    p "foo\n\r".chomp  # => "foo\n"
    ```

1. Enumerable#find
    - 要素に対してブロックを評価した値がtrueになった**最初**の要素を返す
    - detectメソッドも同様の
    ```
    enu = [1, 5, 8, 13, 17, 21, 28, 36].find { |n| n % 7 == 0 }
    print enu
    #=> 21
    ```
   
1. Enumerable#each_with_index
    - 要素とそのインデックスをブロックに渡して繰り返す
    ```
    ["apple", "orange", "grape"].each_with_index do |item, idx|
      p [item, idx]
    end
    # => [5, 0]
    #    [10, 1]
    #    [15, 2]
    ```

1. Enumerable#map, collect
    - 各要素に対してブロックを評価した結果を全て含む配列を返す
    - mapとcollectは同じ動作をする！
    ```
    # すべて 3 倍にする
    p [1, 2, 3].map {|n| n * 3 }  # => [3, 6, 9]
    ```

1. Array#join
    - 配列の要素を文字列を間に挟んで連結した文字を返す
    ```
    [1, 2, 3].join('-') #=> "1-2-3"
    ```

1. Array#shift
    - 配列の先頭の要素を取り除く。取り除いた要素が戻り値になる。
    - 引数を指定した場合はその個数だけ取り除き、それを配列で返す
    ```
    singer=["tanaka", "koyama"]
    p singer.shift
    #=> "tanaka"
    ```
   
1. Array#sort
    - 配列の内容をソートし、配列で返す。
    - ブロックがある場合は要素同士の比較をブロックを用いて行う。ブロックに2つの要素を引数として与えて評価する。

1. Array#dalete_at
    - 引数の位置(インデックス番号)にある要素を取り除きそれを返す。範囲外であったらnilを返す。
    ```
    a = ["1", "3", "5", "2", "3"]
    a.delete_at(3)
    p a
    => ["1", "3", "5", "3"]
    ```

1. Array#delete_if
    - 要素を順番にブロックに渡して評価し、その結果が真になった要素を全て削除する
    - reject!も同様の動作をする
    ```
    a = [0, 1, 2, 3, 4, 5]
    a.delete_if{|x| x % 2 == 0}
    p a #=> [1, 3, 5]
    
    a = [0, 1, 2, 3, 4, 5]
    e = a.reject!
    e.each{|i| i % 2 == 0}
    p a                    #=> [1, 3, 5]  もとの配列から削除されていることに注意。
    ```

1. Array#concat
    - 引数の配列の要素をselfの末尾に**破壊的**に連結します
    
1. Array#delete
    - 引数の値と**等しい**要素を**破壊的に**取り除き、その値を返す
    ```
    id = [1, 2, 3, 4, 5]
    p id.delete(3)
    => 3
    ```

1. Array#slice
    - 指定された自身の要素や部分配列を返す。
    ```
    p [0, 1, 2].slice(0, 2)    #=> [0, 1]
    p [0, 1, 2].slice(2..3)    #=> [2]
    p [0, 1, 2].slice(10, 1)   #=> nil
    ```

1. Array#zip
    - selfと引数に渡した各要素からなる**配列の配列**を生成して返す。
    ```
    a1 = %w(a b)
    a2 = %w(c d)
    a3 = a1.zip(a2)
    p a3.first
    => ["a", "c"]
    ```

1. Array#shift, unshift
    - shift
        - 配列の先頭の要素を**破壊的に**取り除いてそれを返す。
    - unshift
        - 引数に指定された要素を配列の先頭に挿入する。**引数を指定しなければ何もしない！**

1. Array#compact
    - 自身からnilを取り除いた配列を生成して返す **非破壊的メソッドなので注意！**
x
1. Array#uniq
    - 配列から重複した要素を取り除いた新しい配列を返す **非破壊的メソッドなので注意！**

1. Hash#include?
    - ハッシュが引数の値をキーに持つとき、trueを返す
    
1. Hash#merge
    - ハッシュの内容を順番にマージ(統合)した結果を返す。
    ```
    student_1={:name => 'sato', :club => 'tennis'}
    student_2={:name => 'ito', :club => 'football'}
    p student_1.merge(student_2)
    => {:name=>"ito", :club=>"football"} student2のkeyとvalueで上書きされる
    ```

1. Hash#invert
    - 値からキーへのハッシュを作成して返す
    ```
    h = { "a" => 0, "b" => 100, "c" => 200, "d" => 300, "e" => 300 }
    p h.invert   #=> {0=>"a", 100=>"b", 200=>"c", 300=>"e"}
    ```

1. Hash#fetch
    - 引数のkeyに関連づけられた値を返す。
    ```
    ひっかけ・・・'error'は無視する
    h = {:name => 'sato', :club => 'tennis'}.fetch(:name, 'error') 
    print h
    => sato
    ```

1. Hash#delete
    - keyに対応する要素を**破壊的に**取り除く
    ```
    h = {:ab => "some" , :cd => "all"}
    
    p h.delete(:ab) #=> "some"
    p h.delete(:ef) #=> nil
    p h.delete(:ef){|key|"#{key} Nothing"} #=> "ef Nothing"
    
    p h #=> {:cd=>"all"}
    ```

1. Hash#reject
    - ブロックを評価した値が真になる要素を削除したハッシュを返す
    - **非破壊的メソッド**
    ```
    h = { 2 =>"8" ,4 =>"6" ,6 =>"4" ,8 =>"2" }
    p h.reject{|key, value| key.to_i < value.to_i} #=> {6=>"4", 8=>"2"}
    ```

1. IO#seek(offset, whence = IO::SEEK_SET)
    - ファイルポインタをwhenceの位置からoffsetだけ移動させる。
    ```
    io.seek(offset, whence)
    ```

1. Object#clone
    - オブジェクトの複製を作成して返す
    ```
    a = ["fire", "water", "wind"]
    b = a.clone
    => ["fire", "water", "wind"]
    c = a
    => ["fire", "water", "wind"]
    a.concat(["metal"]) 末尾に要素を追加(破壊的)
    => ["fire", "water", "wind", "metal"]
    
    a == b
    => false
    a == c
    => true
    ```

1. Rubyにおける偽の値
    - Rubyではnil, falseが偽の値となる。
    - **0はtrue**なので注意
    - NULLは定義されていない

1. ?+1文字
    - ? + 任意の1文字を足すと、その文字自身を一文字だけ含む文字列オブジェクトを返す。

1. &&演算子
    - 左辺の評価結果がfalseの場合は、右辺を評価せずに次の処理に進む
    ```
    y = false
    y && (raise "failed")
    puts("succeeded!")
    => succeeded!
    ```

1. ||演算子
    - 左から順に評価し、一番最初に真になったものを返す
    ```
    ope = "hamuhamu" == "hamu" * 2 || "Pythonは楽しい"
    print ope
    => true
    ```

1. 正規表現
    - ^（行頭）
    - [^a]（a以外）
    ```
    lit = "weloveRubyONrails"[/^[A-Z][^A-Z]+/]
    print lit
    #=> nil
    ```

1. 〜進数
    - 0d, 0x, 0o, 0b はそれぞれ、10進数、16進数、8進数、2進数を意味します。
    ```
    num = 0d1234       // 10進数 (0dで始まる数値は10進数とみなされる)
    num = 0xffff       // 16進数 (0xで始まる数値は16進数とみなされる)
    num = 0o777        //  8進数 (0oで始まる数値は 8進数とみなされる)
    num = 0b11000100   //  2進数 (0bで始まる数値は 2進数とみなされる)
    ```

1. 日付
    - strftimeで日付をフォーマットして表示する
    ```
    t = Time.gm(1970,1,1)
    puts t.strftime("%Y/%m/%d")
    => 1970/1/1
   
    %Y => 4桁の西暦
    %y => 2桁の西暦
    %m => 月
    %d => 日
    %H => 時刻
    %M => 分
    %S => 秒
    ```
   
1.  予約語
    - 予約語はクラス名、変数名などに用いることはできない。
    ```
    予約語
    while
    class
    など
    ```

1. 