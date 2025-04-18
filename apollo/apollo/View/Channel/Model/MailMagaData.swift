//
//  Data.swift
//  apollo
//
//  Created by 赤尾浩史 on 2023/12/13.
//


import Foundation
import SwiftUI


struct MailMagaData: Identifiable{
    var id = UUID()
    var date: String
    var bunsho: String
}

var mailmagaArray = [
    MailMagaData(date:"2023年12月1日", bunsho: """
おはようございます。

 昨日は朝に第二回の
WCH超党派議員連盟の会合がありました。

メインは外務省の方にパンデミック条約の具体的な条文の内容をヒアリングすることでした。

参加者の皆さんが条文で
特に気にされていたのが、

国の主権を侵すものでないか、
デマや誤情報のチェックはどうするのか、

という部分です。

まだ内容の固まったものではないので、、、との回答でしたが、
我々の持つ懸念は伝えられたかと思います。


また他の論点としては、、、

そもそもWHOがワクチンなどをつくる製薬の資金提供で運営されているから利益相反にあたるのではないか、というものや

パンデミックの定義が決まっていないことが確認され、それのにパンデミック時の対応が話し合われている矛盾、

前回は明確な手順も決まらないまま、WHOの事務総長の発言でパンデミックが認定されたことも確認できました。

条約や規則の前のそもそも論から
話し合うべきではないでしょうか？

こうした議連を通じて、一人でも多くの国会議員の皆さんに、パンデミック条約や国際保健規則の課題やリスクを考えてもらいたいです。

知らなかったでは済まないことがあります。

パンデミック条約についてのわかりやすい動画を教えてもらいました。
https://youtu.be/4l3FpGlIk_E?si=zt6bmxdDLe1MiHda


午後は本会議や委員会の理事懇談会の
開催があるかどうかで待機でしたが、
結局開催はなく、

午後は豈プロジェクトさんのイベントで
パネリストを務めることができました。

テーマは教育でしたが、
私の話せる時間は１０分くらいしかなかったので、しっかり伝えられたかどうか。

夕方からは加賀市の友人のお通夜に出るため、
加賀に戻りました。

彼は私が東京で主催していた勉強会の参加者で6年以上のお付き合いでした。

3年前に私が加賀に移住してきたら、
彼も実家の加賀に戻り、
一緒に加賀のプロジェクトをやってきました。

優しい人で、ずっと活動を支えてくれました。
参政党にも入って応援してくれていました。

彼がいなかったら加賀のプロジェクトは
違う形になっていたかもしれません。

突然の死で受け入れられない自分がいましたが、
今日、彼の安らかな顔を見たら、
涙が止まらなくて、、、
やっと実感が持てました。

今からまた新幹線で東京に戻ります。
いろいろ思い出しながら帰りたいと思います。

たくさんのありがとうを言いたいです。


一昨日、本の執筆を終えたので、
コラムの一部を紹介します。

このコラムは、、、

続きは「KAGURA オンラインサロン」にて
 https://lounge.dmm.com/detail/6011/
"""),
    MailMagaData(date:"2023年12月2日", bunsho: "どんなことでもやり抜きます。"),
    MailMagaData(date:"2023年12月3日", bunsho: "いつまでもお元気で")
]


