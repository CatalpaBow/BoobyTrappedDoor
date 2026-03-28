# Booby Trap Door

## 概要
Taro氏が制作した[Taro Tripwire](https://steamcommunity.com/sharedfiles/filedetails/?id=3034379807)をドア用のブービートラップとして機能できるようにします。

ReadyOrNotスタイルのドアトラップをArma3で再現することを目的として制作されました。

※現状ではエディタでの設置のみの対応となります。
* GitHub Repository: [CatalpaBow/BoobyTrapDoor](https://github.com/CatalpaBow/BoobyTrapDoor/)
* Bug Reports & Feedback: [Issues](https://github.com/CatalpaBow/BoobyTrapDoor/issues)

## 特徴
* ドアが一定以上開くと自動的にトラップが作動。
* ACEの **Incremental Door Opening（ドアの段階開閉）** でトラップを作動させることなくトラップチェックが可能。
* Ace Intraction からトラップの解除が可能(TaroTripwireの機能)
## 前提Mod
* [CBA_A3](https://steamcommunity.com/workshop/filedetails/?id=450814997)
* [ace](https://steamcommunity.com/workshop/filedetails/?id=463939057) 
* [TaroTripwire](https://steamcommunity.com/sharedfiles/filedetails/?id=3034379807)

## 使用方法

### トラップの設置
1. ブービートラップを仕掛けたいドアの手前に **TaroTripWire** を配置する。この際、ドアが開いたことによりワイヤーが引っかかってトラップが起動する、というメカニズムの再現のためにドアが開く側に配置すること。
2. TripWireの初期化フィールドに以下のコードを貼り付ける。

```
[this, "HandGrenade"] call taro_tripwire_fnc_addGrenade;
[this] call btd_trap_fnc_registerTrap;
```

> * **taro_tripwire_fnc_addGrenade関数**: 罠にグレネードを取り付けるための関数です。詳細な内容はTaroTripWireのワークショップページを見てください。
> * **btd_trap_fnc_registerTrap関数**: 第一引数として渡されたオブジェクト(TaroTripWireのObject)をBoobyTrapDoorのシステムに登録する関数です。この関数でトラップを登録しないとドアが開いた時に起爆しません。

### トラップチェックをするには
ACEの **IncrementalDoorOpening** 機能でトラップを起爆することなくトラップチェックができます。一段階だけ開くなら起爆しません。

### トラップを解除するには
トラップに対してACEイントラクションをすることで解除ができます。（TaroTripWire側の機能）

## トラブルシューティング
### ドアを開けてもトラップが作動しない場合

デバッグモードを有効にして、トラップの状態を確認してください。
デバッグモードは、**アドオンオプション > BoobyTrapEditor** から有効化できます。

有効にすると、トラップオブジェクト上にデバッグ用テキストが表示されるようになります。なお、遠距離での視認性を確保するため、一定の距離（100m以内）まで近づかないと詳細な情報は表示されません。

以下は、トラップの状態別の対処法です。

* **「Door not detected」と表示される場合**
    ドアの検知に失敗しています。**アドオンオプション > BoobyTrapDoor > DoorDetection > IncludeList** に、検知対象としたいドアのアニメーション名、またはそのキーワードを追加してください。
    アニメーション名を調べるにはドアが設置されている建物を引数として [animationNames](https://community.bistudio.com/wiki/animationNames) コマンドを実行してください。返り値としてアニメーション名の一覧を取得できます。その中からドアに該当すると思われるアニメーション名前を探しだしてください。
    
    * **例:** 検知されないドアのアニメーション名が `tur_0` の場合、IncludeList に `["door","dvere","tur"]` を追加。

* **それ以外の場合**
    本来ドア用ではないアニメーションを、ドアとして誤検知している可能性があります。デバッグテキストに表示される `DoorAnimationName` を確認し、そのアニメーション名もしくはその一部（例:`door_locked` なら locked）を **アドオンオプション > DoorDetection > ExcludeList** に追加してください。
    * **例:** `DoorAnimationName: 'door_explosion'` と表示される場合は、ExcludeList に `["locked","explosion"]` を追加。

* **上記を試しても改善しない場合**
    バグの可能性があります。GitHub の **[Issue](https://github.com/CatalpaBow/BoobyTrapDoor/issues)** から報告をお願いします。

## Credit
* [Taro Tripwire](https://steamcommunity.com/sharedfiles/filedetails/?id=3034379807): ドアに仕掛けるブービートラップとしてちょうどよいサイズのトラップでした。制作者のTaroに感謝を。