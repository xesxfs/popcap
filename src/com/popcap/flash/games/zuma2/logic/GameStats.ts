module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class GameStats extends egret.HashObject {
							public mTimePlayed:number = 0;
							public mDangerTimePlayed:number = 0;
							public mMaxInARow:number = 0;
							public mNumGaps:number = 0;
							public mMaxCombo:number = 0;
							public mNumMisses:number = 0;
							public mNumCombos:number = 0;
							public mTotalShots:number = 0;
							public mNumGemsCleared:number = 0;
							public mNumBallsCleared:number = 0;
							public mMaxComboScore:number = 0;
							public mMaxInARowScore:number = 0;

							public constructor()
							{
								super();
								super();
							}

							public Add(theStats:com.popcap.flash.games.zuma2.logic.GameStats)
							{
								this.mTimePlayed = flash.checkInt(this.mTimePlayed + theStats.mTimePlayed);
								this.mNumBallsCleared = flash.checkInt(this.mNumBallsCleared + theStats.mNumBallsCleared);
								this.mNumGemsCleared = flash.checkInt(this.mNumGemsCleared + theStats.mNumGemsCleared);
								this.mNumCombos = flash.checkInt(this.mNumCombos + theStats.mNumCombos);
								this.mNumGaps = flash.checkInt(this.mNumGaps + theStats.mNumGaps);
								if(theStats.mMaxCombo > this.mMaxCombo || theStats.mMaxCombo == this.mMaxCombo && theStats.mMaxComboScore > this.mMaxComboScore)
								{
									this.mMaxCombo = flash.checkInt(theStats.mMaxCombo);
									this.mMaxComboScore = flash.checkInt(theStats.mMaxComboScore);
								}
								if(theStats.mMaxInARow > this.mMaxInARow)
								{
									this.mMaxInARow = flash.checkInt(theStats.mMaxInARow);
									this.mMaxInARowScore = flash.checkInt(theStats.mMaxInARowScore);
								}
							}

							public Reset()
							{
								this.mTimePlayed = flash.checkInt(0);
								this.mNumBallsCleared = flash.checkInt(0);
								this.mNumGemsCleared = flash.checkInt(0);
								this.mNumGaps = flash.checkInt(0);
								this.mNumCombos = flash.checkInt(0);
								this.mMaxCombo = flash.checkInt(-1);
								this.mMaxComboScore = flash.checkInt(0);
								this.mMaxInARow = flash.checkInt(0);
								this.mMaxInARowScore = flash.checkInt(0);
								this.mDangerTimePlayed = flash.checkInt(0);
								this.mTotalShots = flash.checkInt(this.mNumMisses = flash.checkInt(0));
							}

						}
					}
				}
			}
		}
	}
}

