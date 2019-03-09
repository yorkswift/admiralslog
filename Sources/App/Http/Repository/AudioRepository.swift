import Foundation

class AudioRepository {
    
    static let shared = AudioRepository()
    
    let cdn = "https://static.wixstatic.com/mp3/"
    
    func urlForAudio(with initials:String) -> String? {
        
        if let basename = audio[initials] {
            return cdn + basename + ".mp3"
        } else {
            return nil
        }
        
    }
    
    func intro() -> String {
        
        return urlForAudio(with:"intro") ?? ""
        
    }
    
    let audio = [
          "INTRO":"e65a0c_e765ea60ced14fd69e089ae727346fb7",
          "ERRR":"e65a0c_1dd2850a5a9e4757979c8020e3d8c9bf",
          "EIIR":"e65a0c_ea11935364164e309aab9b04afb7d53f",
          "AADD":"e65a0c_32f50178c6e64e91834e3f921590e1cf",
          "DDDE":"e65a0c_57a21b85d89e4a4092d806d631b66c27",
          "DDDD":"e65a0c_c3d407ab49fe49dbaf3b134784bbc8bb",
          "DIRR":"e65a0c_c59e7b99f0ce4545b0d19dc47ad25948",
          "AERR":"e65a0c_126a179100f14f359d6226140bea1654",
          "AIRR":"e65a0c_d07cda3d14d8430db444bf3524d490ff",
          "EEEE":"e65a0c_1910235de66a492ea7c2e89c980e8e9a",
          "EEER":"e65a0c_a5534822ed724f6b9e644bae8a8edc9e",
          "IIIE":"e65a0c_282b078772da4ef4955d31b33b46838b",
          "DIIR":"e65a0c_d1facd48f67c4c4882101799012b8bc7",
          "DERR":"e65a0c_dedfc772e6284f7a9f096be4fbea1217",
          "DIII":"e65a0c_8b6e93b48b064d53985756f64ff6c8cd",
          "AAAI":"e65a0c_a56b958e5b074f8bad65809d4b52aef6",
          "EEEI":"e65a0c_ce159c2895634ea18cb76d055deeee56",
          "AEER":"e65a0c_af53417de3624d878b0e2df71707eb4e",
          "EEED":"e65a0c_47cf0ef269c14ca4aeaddd8f18448345",
          "AEII":"e65a0c_ad9147bbc9534f9495236975b4bedf35",
          "IIRR":"e65a0c_3cec607674ee43ea9be3f8692c52d947",
          "DDRR":"e65a0c_789951d15a2041aa9b117954eb7a5aa5",
          "ARRR":"e65a0c_ed184a91480d4ba4a6f76a0b98c8749b",
          "EEDR":"e65a0c_524e0474ec9d4ca092715c1485f99cb7",
          "DRRR":"e65a0c_58e78628538b4795923335747274db6a",
          "AAER":"e65a0c_93950482694d4e818bc7a0370fb66aa8",
          "DEII":"e65a0c_9bcf17e95eb74d8c9b927b271bc95ecc",
          "DDDI":"e65a0c_26de240af1c8450097d924af172cebb3",
          "DDIR":"e65a0c_56946c6fd4aa45f18c728a5cb52c8aae",
          "AAEI":"e65a0c_788e373a94d54aa2a20aecef073e9715",
          "AADE":"e65a0c_1390f509ab15422faccdcf884c065dda",
          "DDII":"e65a0c_21cdfee3e95c4a008cb2992c59fd9f08",
          "EIRR":"e65a0c_19da660fcb4a4103a7fa8e7670232650",
          "EEIR":"e65a0c_255dd145f17f412e8d482c3e8e524dad",
          "DDEI":"e65a0c_3efafa826fb34328ab3624261a292946",
          "ADEE":"e65a0c_802d139980ca49488248f49bd353bf39",
          "AAAA":"e65a0c_6cadd3e62e96406d892c7958fcde5f98",
          "AEEE":"e65a0c_9b24f03d0622413ebe933bf02a2966e0",
          "AADR":"e65a0c_27a9133099934bfdb1a971feec6e314a",
          "AADI":"e65a0c_5131ad00bfff4c11bb75115f93761fb6",
          "EEII":"e65a0c_d3c95c2e98c84558b08de6c5ee0c6059",
          "ADEI":"e65a0c_b6c8f3537f79486fb989d94b53466724",
          "AAAD":"e65a0c_3b0781dcf8f54b4d8b35128b9a8afb1f",
          "EERR":"e65a0c_1d593dd850d2436b86518b81e807bd7e",
          "ADRR":"e65a0c_e4903545728a4990af57dbad5642d331",
          "DDER":"e65a0c_ca304476e7d34d63bae6ee04d6390bcf",
          "AARR":"e65a0c_76ab27eefae74df3aa7b4e83fafc5479",
          "AIIR":"e65a0c_146d020750c3419a8fe7acb29d369ef3",
          "AAAE":"e65a0c_e6ffb334b3a249f08c474180215edb2d",
          "IIII":"e65a0c_fd9cab5b32c547c9af042def04db672b",
          "IRRR":"e65a0c_710c6e8585ff4f98ac04876a3da7db25",
          "AAIR":"e65a0c_bde7a87f3f1d4b2c857cf6572613b800",
          "ADER":"e65a0c_eba57213f59f4ed894dea48e9fb43b0d",
          "AEEI":"e65a0c_a7431166aed141bcb3786b64e0f7f41a",
          "DDEE":"e65a0c_9f6b0acac6ee441ea0733b7bb670c52d",
          "ADDI":"e65a0c_2063cf58dcab4eaeb1ff6f2e5659f878",
          "ADII":"e65a0c_8c7ebbfb0b2344ad956633566c95563e",
          "RRRR":"e65a0c_531dcd51cf3447418db813a1e6f6adeb",
          "ADDE":"e65a0c_e9399bb1b0444a4ca16c20094be736a9",
          "ADIR":"e65a0c_8d9700f1569244c3b152316c4d9df901",
          "AAEE":"e65a0c_fb2a66956722473e9c20aea6f8d71568",
          "AEIR":"e65a0c_cc49eb2dbbd44c4ba93cd402a0188834",
          "AAAR":"e65a0c_95474f5356c34732b6f12a634d14d48b",
          "IIIR":"e65a0c_07bb028e5039488a90f14d57556eae2c",
          "DDDR":"e65a0c_fdcae01361eb4629896fffc7a179f277",
          "AIII":"e65a0c_6a03ad106c9d414c9cb88aa5c671e3a3",
          "ADDD":"e65a0c_31f3a6b856634acd893f80636857fdaf",
          "DEIR":"e65a0c_e46aa56780e04593a380e069bcd8eeb5",
          "ADDR":"e65a0c_c75d2afcd8d04bd2945e5b2fd4898a0c",
          "AAII":"e65a0c_ee5b5c6bef50425a9cf56a0b2c53b7ec",
          "EEDI":"e65a0c_208d34b02e6d4f6e9685343b42f52cca"]
    
}
