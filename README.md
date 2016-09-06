/**
 * 第4章 倉庫番のお仕事
 *
 * 問題14 各部対抗ブロックじゃんけん
 *
 * 今日はXO商事の年に一度の恒例行事、各部対抗ブロックじゃんけんの日です。
 * Yさんは東北支社のSさんと対戦することになっています。
 * ブロックじゃんけんのルールは下記の通りです。
 *
 * 1...5箱からなるコンテナを用意する。
 * 2...各箱にはグーブロック、チョキブロック、パーブロックのどれかを入れる。
 * 3...ただし上記三つのブロックの使用は、それぞれ2個までとする。
 * 4...対戦者は互いにオープンするブロックを決め、出たブロックでジャンケン勝負。
 * 5...4を5回繰り返し、勝ちが多かった方を最終的な勝者とする。
 *
 * コメントの位置に適切なコードを記述し、
 * 実行例と同じメッセージを表示してください。
 *
 * <実行例>
 *  Yさん：
 *  よし、今日はがんばるぞ！
 *
 *  コンテナ1に入れるブロックを選択してください（1.グー、2.チョキ、3.パー）＞3
 *
 *  コンテナ2に入れるブロックを選択してください（1.グー、2.チョキ、3.パー）＞2
 *
 *  コンテナ3に入れるブロックを選択してください（1.グー、2.チョキ、3.パー）＞2
 *
 *  コンテナ4に入れるブロックを選択してください（1.グー、2.チョキ、3.パー）＞1
 *
 *  コンテナ5に入れるブロックを選択してください（1.グー、2.チョキ、3.パー）＞3
 *
 *  1回戦
 *  Yさん：
 *  どの手を出そうかな～
 *
 *  Sさん：
 *  はやぐ決めれ！腹減ってしゃねてば
 *
 *  オープンするコンテナを決めてください＞2
 *
 *  Yさん：
 *  よし、2番コンテナだ！
 *
 *  Sさん：
 *  こっちは3番コンテナだべ！
 *
 *  審判：
 *  ではオープンしてみましょう。
 *
 *  審判：
 *  Yさん：チョキ VS Sさん：パー
 *  で、Yさんの勝ちです。
 *
 *  Yさん：
 *  やった勝ちだ！
 *
 *  Sさん：
 *  あー、もうやんだぐなっできた...
 *
 *  ～～～～～～～～ 中略 ～～～～～～～～～
 *
 *  審判：
 *  対戦終了です。 結果は...
 *
 *  審判：
 *  Yさん：2勝1敗2分け
 *  Sさん：1勝2敗2分け
 *  で、Yさんの勝利です。
 *
 *  Yさん：
 *  まあ、そうなるよね。
 *
 *  Sさん：
 *  こっだなことがあっでいいんだべか！
 *
 * <1対戦ごとのじゃんけんでYさんが負けた場合の実行例>
 *  Yさん：
 *  次は勝つぞ！
 *
 *  Sさん：
 *  負けるわけねべ！
 *
 * <1対戦ごとのじゃんけんで引き分けた場合の実行例>
 *  Yさん：
 *  おしいな～
 *
 *  Sさん：
 *  実質おらの勝ちだべ。
 *
 * <最終判定でYさんが負けた場合の実行例>
 *  Yさん：
 *  負けちゃった。悔しいな～
 *
 *  Sさん：
 *  弱い者に勝っても、な～んも自慢になんねな。
 *
 * <最終判定で引き分けた場合の実行例>
 *  Yさん：
 *  ふ～。なんとか引き分けたか。
 *
 *  Sさん：
 *  次はたんげがんばるはんで、応援してけれな。
 *
 * <グーチョキパー以外の数値が入力された場合の実行例>
 *  Yさん：
 *  え～。そんな手ないよ。
 *
 *  コンテナ○に入れるブロックを選択してください（1.グー、2.チョキ、3.パー）＞
 *
 * <その手が既に2回使用されていた場合の実行例>
 *  Yさん：
 *  ○○はもう使えません。(※○○にはグー、チョキ、パーの何れかが入る)
 *
 *  コンテナ○に入れるブロックを選択してください（1.グー、2.チョキ、3.パー）＞
 *
 * <既にオープンしたコンテナが入力された場合の実行例>*
 *  Yさん：
 *  そのコンテナはもうオープンしちゃったよ。
 *
 * <存在しないコンテナが入力された場合の実行例>*
 *  Yさん：
 *  え～。そんなコンテナないよ。
 *
 */

package lesson07.challenge14;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Random;

public class WarehouseManager {

	public static void main(String[] args) throws IOException {

		String[] handArray = { "グー", "チョキ", "パー" };
		int winPoint = 0;
		int losePoint = 0;
		int drawPoint = 0;
		int stoneCount1 = 0;
		int stoneCount2 = 0;
		int scissorsCount1 = 0;
		int scissorsCount2 = 0;
		int paperCount1 = 0;
		int paperCount2 = 0;

		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		System.out.println("Yさん：");
		System.out.println("よし、今日はがんばるぞ！");
		int[] jankenArray1 = new int[5];
		int[] jankenArray2 = new int[5];

		// Yさんのコンテナにじゃんけんの手を入れる処理を記述する。
		for (int i = 0; i < jankenArray1.length; i++) {
			System.out.println(" コンテナ" + (i + 1)
					+ "に入れるブロックを選択してください（1.グー、2.チョキ、3.パー）＞");
			int hand = Integer.parseInt(br.readLine()) - 1;

			switch (hand) {
			case 0:
				jankenArray1[i] = hand;
				stoneCount1++;
				break;
			case 1:
				jankenArray1[i] = hand;
				scissorsCount1++;
				break;
			case 2:
				jankenArray1[i] = hand;
				paperCount1++;
				break;
			default:
				System.out.println("\nYさん：");
				System.out.println(" え～。そんな手ないよ。");
				System.exit(0);
			}
			if (stoneCount1 == 2 || scissorsCount1 == 2 || paperCount1 == 2) {

			}
		}
		// Sさんのコンテナにじゃんけんの手を入れる処理を記述する。（ランダム）

		Random rand = new Random();

		for (int i = 0; i < jankenArray2.length; i++) {
			if (rand.nextInt(3) == 0) {
				jankenArray2[i] = 0;
				stoneCount2++;
			} else if (rand.nextInt(3) == 1) {
				jankenArray2[i] = 1;
				scissorsCount2++;
			} else if (rand.nextInt(3) == 2) {
				jankenArray2[i] = 2;
				paperCount2++;
			}

		}

		for (int count = 0; count < 5; count++) {

			System.out.println("-----------------【" + (count + 1)
					+ "回戦目】-----------------------");
			System.out.println("\nYさん：");
			System.out.println("どの手を出そうかな～\n");

			System.out.println("Sさん：");
			System.out.println("はやぐ決めれ！腹減ってしゃねてば\n");

			int openNum1 = 0;

			// Yさんのどのコンテナをオープンするか入力してもらう処理を記述する。
			System.out.println("オープンするコンテナを決めてください＞");
			openNum1 = Integer.parseInt(br.readLine()) - 1;

			int openNum2 = 0;

			// Sさんのどのコンテナをオープンするか決定する処理を記述する。（ランダム）

			openNum2 = rand.nextInt(5);

			System.out.println("\nYさん：");
			System.out.println("よし、" + (openNum1 + 1) + "番コンテナだ！\n");

			System.out.println("Sさん：");
			System.out.println("こっちは" + (openNum2 + 1) + "番コンテナだべ！\n");

			System.out.println("審判：");
			System.out.println("ではオープンしてみましょう。\n");

			System.out.println("審判：");
			System.out.print("Yさん：" + handArray[jankenArray1[openNum1]]);
			System.out.print(" VS ");
			System.out.println("Sさん：" + handArray[jankenArray2[openNum2]]);
			System.out.print("で、");

			// 1回ごとの勝敗判定およびメッセージの出力処理を記述する。
			if (jankenArray1[openNum1] == jankenArray2[openNum2]) {
				System.out.println("引き分けです");
				System.out.println("");
				System.out.println("\nYさん：");
				System.out.println("おしいな～");
				System.out.println("Sさん：");
				System.out.println("実質おらの勝ちだべ。");
				System.out.println("");
				drawPoint++;
			} else if ((jankenArray1[openNum1] == 0 && jankenArray2[openNum2] == 1)
					|| (jankenArray1[openNum1] == 1 && jankenArray2[openNum2] == 2)
					|| (jankenArray1[openNum1] == 2 && jankenArray2[openNum2] == 0)

			) {
				System.out.println("Yさんの勝ちです。");
				System.out.println("");
				System.out.println("Yさん：");
				System.out.println("やった勝ちだ！");
				System.out.println("");
				System.out.println("Ｓさん");
				System.out.println("あー、もうやんだぐなっできた…");
				System.out.println("");
				winPoint++;
			} else {
				System.out.println("Sさんの勝ちです。");
				System.out.println("");
				System.out.println("Yさん：");
				System.out.println("次は勝つぞ！");
				System.out.println("");
				System.out.println("Ｓさん");
				System.out.println("負けるわけねええ！");
				System.out.println("");
				losePoint++;
			}

		}
		System.out.println("----------------------------------------");
		System.out.println("審判：");
		System.out.println("対戦終了です。 結果は...\n");

		System.out.println("審判：");
		System.out.println("Yさん：" + winPoint + "勝" + losePoint + "敗"
				+ drawPoint + "分け");
		System.out.println("Sさん：" + losePoint + "勝" + winPoint + "敗"
				+ drawPoint + "分け");
		System.out.print("で、");

		if (winPoint > losePoint) {
			System.out.println("Yさんの勝利です。\n");
			System.out.println("Yさん：");
			System.out.println("まあ、そうなるよね。\n");
			System.out.println("Sさん：");
			System.out.println("こっだなことがあっでいいんだべか！\n");
		} else if (winPoint < losePoint) {
			System.out.println("Sさんの勝利です。\n");
			System.out.println("Yさん：");
			System.out.println("負けちゃった。悔しいな～\n");
			System.out.println("Sさん：");
			System.out.println("弱い者に勝っても、な～んも自慢になんねな。\n");
		} else {
			System.out.println("引き分けです。\n");
			System.out.println("Yさん：");
			System.out.println("ふ～。なんとか引き分けたか。\n");
			System.out.println("Sさん：");
			System.out.println("次はたんげがんばるはんで、応援してけれな。\n");
		}
	}
}
