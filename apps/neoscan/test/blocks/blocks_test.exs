defmodule Neoscan.BlocksTest do
  use Neoscan.DataCase
  import Neoscan.Factory
  alias Neoscan.Blocks

  @block0 %{
    "confirmations" => 2_291_280,
    "hash" =>
      <<212, 37, 97, 227, 211, 14, 21, 190, 100, 0, 182, 223, 47, 50, 142, 2, 210, 191, 99, 84,
        196, 29, 206, 67, 59, 197, 118, 135, 200, 33, 68, 191>>,
    "index" => 0,
    "merkleroot" => "0x803ff4abe3ea6533bcc0be574efa02f83ae8fdc651c879056b0d9be336c01bf4",
    "nextblockhash" => "0xd782db8a38b0eea0d7394e0f007c61c71798867578c77c387c08113903946cc9",
    "nextconsensus" => "APyEx5f4Zm4oCHwFWiSTaph1fPBxZacYVR",
    "nonce" => "000000007c2bac1d",
    "previousblockhash" => "0x0000000000000000000000000000000000000000000000000000000000000000",
    "script" => %{
      "invocation" => "",
      "verification" => "51"
    },
    "size" => 401,
    "time" => 1_468_595_301,
    "transfers" => [],
    "tx" => [
      %{
        "attributes" => [],
        "net_fee" => "0",
        "nonce" => 2_083_236_893,
        "scripts" => [],
        "size" => 10,
        "sys_fee" => "0",
        "hash" =>
          <<251, 91, 215, 43, 45, 103, 146, 215, 93, 194, 241, 8, 79, 250, 158, 159, 112, 202,
            133, 84, 60, 113, 122, 107, 19, 217, 149, 155, 69, 42, 87, 214>>,
        "type" => "MinerTransaction",
        "version" => 0,
        "vin" => [],
        "vout" => []
      },
      %{
        "asset" => %{
          "admin" => "Abf2qMs1pzQb8kYk9RuxtUb9jtRKJVuBJt",
          "amount" => "100000000",
          "name" => [
            %{"lang" => "zh-CN", "name" => "小蚁股"},
            %{"lang" => "en", "name" => "AntShare"}
          ],
          "owner" => "00",
          "precision" => 0,
          "type" => "GoverningToken"
        },
        "attributes" => [],
        "net_fee" => "0",
        "scripts" => [],
        "size" => 107,
        "sys_fee" => "0",
        "hash" =>
          <<197, 111, 51, 252, 110, 207, 205, 12, 34, 92, 74, 179, 86, 254, 229, 147, 144, 175,
            133, 96, 190, 14, 147, 15, 174, 190, 116, 166, 218, 255, 124, 155>>,
        "type" => "RegisterTransaction",
        "version" => 0,
        "vin" => [],
        "vout" => []
      },
      %{
        "asset" => %{
          "admin" => "AWKECj9RD8rS8RPcpCgYVjk1DeYyHwxZm3",
          "amount" => "100000000",
          "name" => [
            %{"lang" => "zh-CN", "name" => "小蚁币"},
            %{"lang" => "en", "name" => "AntCoin"}
          ],
          "owner" => "00",
          "precision" => 8,
          "type" => "UtilityToken"
        },
        "attributes" => [],
        "net_fee" => "0",
        "scripts" => [],
        "size" => 106,
        "sys_fee" => "0",
        "hash" =>
          <<96, 44, 121, 113, 139, 22, 228, 66, 222, 88, 119, 142, 20, 141, 11, 16, 132, 227, 178,
            223, 253, 93, 230, 183, 177, 108, 238, 121, 105, 40, 45, 231>>,
        "type" => "RegisterTransaction",
        "version" => 0,
        "vin" => [],
        "vout" => []
      },
      %{
        "attributes" => [],
        "net_fee" => "0",
        "scripts" => [%{"invocation" => "", "verification" => "51"}],
        "size" => 69,
        "sys_fee" => "0",
        "hash" =>
          <<54, 49, 246, 96, 36, 202, 111, 91, 3, 61, 126, 8, 9, 235, 153, 52, 67, 55, 72, 48, 2,
            90, 249, 4, 251, 81, 176, 51, 79, 18, 124, 218>>,
        "type" => "IssueTransaction",
        "version" => 0,
        "vin" => [],
        "vout" => [
          %{
            "address" => "AQVh2pG732YvtNaxEGkQUei3YA4cvo7d2i",
            "asset" => "0xc56f33fc6ecfcd0c225c4ab356fee59390af8560be0e930faebe74a6daff7c9b",
            "n" => 0,
            "value" => "100000000"
          }
        ]
      }
    ],
    "version" => 0
  }

  @block4130 %{
    "confirmations" => 2_287_186,
    "hash" =>
      <<106, 127, 230, 71, 27, 60, 47, 146, 163, 147, 231, 180, 144, 119, 187, 172, 12, 225, 49,
        51, 67, 147, 215, 85, 101, 190, 146, 176, 77, 27, 241, 180>>,
    "index" => 4130,
    "merkleroot" => "0x0e523d0390d2ebc1d84c9640459ff065232aadb7c485a068882105d8e1c936fa",
    "nextblockhash" => "0xdebe7fe75d977a89dfaf36f0f543e9e99add4e8f5ed5fcfa57afff9dca327400",
    "nextconsensus" => "APyEx5f4Zm4oCHwFWiSTaph1fPBxZacYVR",
    "nonce" => "1652c5384c5afe53",
    "previousblockhash" => "0xeeb694b93c56d60528c55549ce2216077584e8976eb8f77519dcdfa9643ab4a8",
    "script" => %{
      "invocation" =>
        "40353e08bf28525702ae3f09b58504eb05e1a435bb44fd4adb3773a3bb0d36e4aa74ef8b81bae60cfbb5726ecd106b4e89fd110f312528719c74b7d50c70f0531d4062f0a12518b36c38efe9f97b5a7d0ba02865db4de8d8c137e9bd067fd19fe5bc2af4eae347e6d679e4603eb2cc6e5a7b0e9301961f6b4f902973c1889f7e531840b4a27d5ae0abb10bc9fdad4f46ddb4d598b2a65d80289fafc64f5a3022a511db6187df1d499812fd55ca8fffbcb90b7d7ec7a09dc3ad89e0d2f96c36e002a64c40bf59b482f88072848bb5f1d680742514dc6a729c330133771acf21e323ce6ee379d85372ae2d3d0ea98487f2352bad4f7066995db137b765d2c8a342182ec1b140e9386cc1ed8f400f2b0494832dc0d434389c3bc6bbc730d1567262b86556e336c5aeccc2c7c4e4cb8d12b1c8b0b801d472d8276e990a83db75716167be5a7004",
      "verification" =>
        "552102486fd15702c4490a26703112a5cc1d0923fd697a33406bd5a1c00e0013b09a7021024c7b7fb6c310fccf1ba33b082519d82964ea93868d676662d4a59ad548df0e7d2102aaec38470f6aad0042c6e877cfd8087d2676b0f516fddd362801b9bd3936399e2103b209fd4f53a7170ea4444e0cb0a6bb6a53c2bd016926989cf85f9b0fba17a70c2103b8d9d5771d8f513aa0869b9cc8d50986403b78c6da36890638c3d46a5adce04a2102ca0e27697b9c248f6f16e085fd0061e26f44da85b58ee835c110caa5ec3ba5542102df48f60e8f3e01c48ff40b9b7f1310d7a8b2a193188befe1c2e3df740e89509357ae"
    },
    "size" => 1351,
    "time" => 1_476_724_549,
    "transfers" => [],
    "tx" => [
      %{
        "attributes" => [],
        "net_fee" => "0",
        "nonce" => 1_281_031_763,
        "scripts" => [],
        "size" => 10,
        "sys_fee" => "0",
        "hash" =>
          <<95, 94, 64, 88, 234, 89, 168, 245, 63, 56, 24, 96, 97, 102, 30, 123, 224, 27, 73, 82,
            209, 57, 55, 132, 247, 255, 155, 216, 239, 135, 215, 147>>,
        "type" => "MinerTransaction",
        "version" => 0,
        "vin" => [],
        "vout" => []
      },
      %{
        "attributes" => [],
        "net_fee" => "0",
        "scripts" => [
          %{
            "invocation" =>
              "406a159b7552c7eaedc79abc86faeca7aa50af52aaa0f14aa9a4abaf498f270a140709992253df55de1b2fd93a6ea13b5344dacbd4e54e4f661fe073edeb72e2f740e28c0866c2ea963e40f8f6edbc1e40b76181fef43a4016d234602a52b31b83f02d745d57188cd72fcb1a8394a39d77270334374848266bb87a29fa4114d1b13240c1e7eae0e8e8d33b1a16c8ece8e96bc832d8f0a069499b8b9590609d8cd2a799a555f5433bdc153466bf6eefea0a568bd08b28afabfacb673785fe8d59ab82ea404874390b85c4d37d3645e03cae571000f3ca344452c2a4018aab57f73750dfb695c5488e3c9887699a2ff69e539b7e37278f470b03bc357ebaad25c397ef3104",
            "verification" =>
              "542102486fd15702c4490a26703112a5cc1d0923fd697a33406bd5a1c00e0013b09a7021024c7b7fb6c310fccf1ba33b082519d82964ea93868d676662d4a59ad548df0e7d2102aaec38470f6aad0042c6e877cfd8087d2676b0f516fddd362801b9bd3936399e2103b209fd4f53a7170ea4444e0cb0a6bb6a53c2bd016926989cf85f9b0fba17a70c2103b8d9d5771d8f513aa0869b9cc8d50986403b78c6da36890638c3d46a5adce04a2102ca0e27697b9c248f6f16e085fd0061e26f44da85b58ee835c110caa5ec3ba5542102df48f60e8f3e01c48ff40b9b7f1310d7a8b2a193188befe1c2e3df740e89509357ae"
          }
        ],
        "size" => 665,
        "sys_fee" => "0",
        "hash" =>
          <<238, 133, 212, 137, 228, 66, 138, 83, 143, 57, 193, 144, 55, 113, 225, 242, 34, 163,
            131, 248, 50, 124, 150, 237, 25, 204, 2, 7, 145, 73, 161, 253>>,
        "type" => "ContractTransaction",
        "version" => 0,
        "vin" => [
          %{
            "txid" => "0x3631f66024ca6f5b033d7e0809eb993443374830025af904fb51b0334f127cda",
            "vout" => 0
          }
        ],
        "vout" => [
          %{
            "address" => "Ae2d6qj91YL3LVUMkza7WQsaTYjzjHm4z1",
            "asset" => "0xc56f33fc6ecfcd0c225c4ab356fee59390af8560be0e930faebe74a6daff7c9b",
            "n" => 0,
            "value" => "1000"
          },
          %{
            "address" => "AWHX6wX5mEJ4Vwg7uBcqESeq3NggtNFhzD",
            "asset" => "0xc56f33fc6ecfcd0c225c4ab356fee59390af8560be0e930faebe74a6daff7c9b",
            "n" => 1,
            "value" => "99999000"
          }
        ]
      }
    ],
    "version" => 0
  }

  @block4159 %{
    "confirmations" => 2_332_973,
    "hash" =>
      <<87, 218, 7, 146, 105, 204, 99, 7, 175, 238, 36, 72, 217, 152, 102, 210, 191, 80, 81, 129,
        216, 244, 132, 70, 92, 31, 18, 62, 153, 225, 23, 170>>,
    "index" => 4159,
    "merkleroot" => "0xd246ee15eacde5d0190c6cd8409905a08caf68716e64054cee844556c6c59644",
    "nextblockhash" => "0xee4c5c8ce2dfff12ee79490468e359fb8a9cede4ce760e3aaf756c219ff10fb7",
    "nextconsensus" => "APyEx5f4Zm4oCHwFWiSTaph1fPBxZacYVR",
    "nonce" => "d8db020a6c8c44bb",
    "previousblockhash" => "0xcc612d84a71e47b3027caa713aef40eace38a0e7187385275f3be0cdbf05a214",
    "script" => %{
      "invocation" =>
        "40bd0aa4094dcf14f2376ed5de727757619f79c4eed6004f40a2aea2021c29fb1085e70ca84cb1cdafa2b732eed9099d73d8eb5686f2e8ce495c8da1837c5db8e0409c5c399b087bfed8df4fc243105ad3208b4aeff12e6403a5ab39aff5157ae91ed49676cbd7d288fe7121ecbc70119d64d137daaa28e5812640a786dc2a415d79408fcadd3d633345977327687f16567977d6206096665b06ffb9b7a99c1e3767893b09aa9034ba3f59ca405240c07f2bd372602cb19f6c43b034cf820373287cb3407ee6a8e8151bb42d298e92b499fb9fdcbfdf132e89c2af9cb98a555f795b6e1fc35623de2972292b0a1fa9bff84a9c59fd908713a7b2f98284e1142655dc5d434026bbb213e41404beceabe146ea007361dbc6b5e94a1d124350a6f95062a57e6a4536471dadcade38de76a996d8dd4aaac970b32a837666f82fa2e6dfd1b96402",
      "verification" =>
        "552102486fd15702c4490a26703112a5cc1d0923fd697a33406bd5a1c00e0013b09a7021024c7b7fb6c310fccf1ba33b082519d82964ea93868d676662d4a59ad548df0e7d2102aaec38470f6aad0042c6e877cfd8087d2676b0f516fddd362801b9bd3936399e2103b209fd4f53a7170ea4444e0cb0a6bb6a53c2bd016926989cf85f9b0fba17a70c2103b8d9d5771d8f513aa0869b9cc8d50986403b78c6da36890638c3d46a5adce04a2102ca0e27697b9c248f6f16e085fd0061e26f44da85b58ee835c110caa5ec3ba5542102df48f60e8f3e01c48ff40b9b7f1310d7a8b2a193188befe1c2e3df740e89509357ae"
    },
    "transfers" => [],
    "size" => 888,
    "time" => 1_476_725_105,
    "tx" => [
      %{
        "attributes" => [],
        "net_fee" => "0",
        "nonce" => 1_821_131_963,
        "scripts" => [],
        "size" => 10,
        "sys_fee" => "0",
        "hash" =>
          <<91, 245, 34, 11, 26, 247, 173, 91, 39, 163, 223, 207, 5, 123, 185, 207, 157, 126, 36,
            200, 181, 115, 248, 239, 9, 97, 87, 97, 162, 237, 58, 234>>,
        "type" => "MinerTransaction",
        "version" => 0,
        "vin" => [],
        "vout" => []
      },
      %{
        "attributes" => [],
        "net_fee" => "0",
        "scripts" => [
          %{
            "invocation" =>
              "4046d0a0f8dc60bc469965564ae0f1a759bcce6fd155da771d64a0725da0f38726afee07bc528ac256c86d7b8c76d1c99d3c5a3b9ca760b2142c67ef23f1833ee5",
            "verification" =>
              "2103b209fd4f53a7170ea4444e0cb0a6bb6a53c2bd016926989cf85f9b0fba17a70cac"
          }
        ],
        "size" => 202,
        "sys_fee" => "0",
        "hash" =>
          <<50, 227, 164, 249, 42, 222, 226, 172, 240, 224, 69, 90, 248, 219, 8, 147, 152, 160,
            141, 200, 163, 34, 139, 81, 197, 70, 83, 40, 255, 135, 86, 196>>,
        "type" => "ContractTransaction",
        "version" => 0,
        "vin" => [
          %{
            "txid" => "0xee85d489e4428a538f39c1903771e1f222a383f8327c96ed19cc02079149a1fd",
            "vout" => 1
          }
        ],
        "vout" => [
          %{
            "address" => "AQVh2pG732YvtNaxEGkQUei3YA4cvo7d2i",
            "asset" => "0xc56f33fc6ecfcd0c225c4ab356fee59390af8560be0e930faebe74a6daff7c9b",
            "n" => 0,
            "value" => "99999000"
          }
        ]
      }
    ],
    "version" => 0
  }

  @block4273 %{
    "confirmations" => 2_332_861,
    "hash" =>
      <<13, 123, 85, 165, 12, 152, 135, 22, 74, 76, 180, 67, 177, 97, 1, 18, 125, 120, 17, 95,
        198, 172, 74, 115, 243, 144, 131, 187, 123, 251, 129, 58>>,
    "index" => 4273,
    "merkleroot" => "0x76d1d32cd6aa7b0fea75330a1a5fe9a54732fb2c3c51d9c7d643b2f6fa1f045f",
    "nextblockhash" => "0xb4925de0a488e22ac3767d3889ce3802d22db2d2a470c61de23ef16584d70e3e",
    "nextconsensus" => "APyEx5f4Zm4oCHwFWiSTaph1fPBxZacYVR",
    "nonce" => "cb56599fdcd90819",
    "previousblockhash" => "0xa41cbaa4eab0535be228d46c9049ff5f03e34cb5c3636e69bf838e62159a83b7",
    "script" => %{
      "invocation" =>
        "40357c030ecc1491200870927d2ae3dd57b76f9ecffbb9b572f10a5d61e3a7f5024f6f430325ad31e3be8a4b109c34818404ea64fd55599937ab6faf40c45cc4c040fbdb32c91e9f404b849a90255413b6d0c146ddf86b19329a17704967e433e822a6b909dad8e41421f8380e848fabb8ba72d2f010431b3462a62ead1d813ed302409d7b910ae7557f06a8acb1e7dda0c30e77e74fddd43c21a6d62f5db87391531603df714d60fd51988de0b8c0003babf33a8e6a389760bbfb569b9e6b19913e8f401c099255cd15195dd1cbe6a5cdf839f8cce4a27ed83145d800725d86eea21d8816512a9186e4ce2e57939a204e9be17a928723c0324e54d9da03214c56db979f40132f649388e47577741dec20df080102aa8ff46a9fc682bb9b7149d68d15d00adaeadf6a2978a28fd14117a193344d1999e931f2ce646d351aee5ce9b6a69bd1",
      "verification" =>
        "552102486fd15702c4490a26703112a5cc1d0923fd697a33406bd5a1c00e0013b09a7021024c7b7fb6c310fccf1ba33b082519d82964ea93868d676662d4a59ad548df0e7d2102aaec38470f6aad0042c6e877cfd8087d2676b0f516fddd362801b9bd3936399e2103b209fd4f53a7170ea4444e0cb0a6bb6a53c2bd016926989cf85f9b0fba17a70c2103b8d9d5771d8f513aa0869b9cc8d50986403b78c6da36890638c3d46a5adce04a2102ca0e27697b9c248f6f16e085fd0061e26f44da85b58ee835c110caa5ec3ba5542102df48f60e8f3e01c48ff40b9b7f1310d7a8b2a193188befe1c2e3df740e89509357ae"
    },
    "size" => 888,
    "time" => 1_476_727_229,
    "transfers" => [],
    "tx" => [
      %{
        "attributes" => [],
        "net_fee" => "0",
        "nonce" => 3_705_210_905,
        "scripts" => [],
        "size" => 10,
        "sys_fee" => "0",
        "hash" =>
          <<106, 137, 30, 161, 218, 61, 114, 243, 129, 237, 94, 104, 119, 52, 87, 86, 225, 56, 71,
            139, 186, 182, 190, 59, 244, 123, 88, 54, 120, 123, 144, 180>>,
        "type" => "MinerTransaction",
        "version" => 0,
        "vin" => [],
        "vout" => []
      },
      %{
        "attributes" => [],
        "net_fee" => "0",
        "scripts" => [
          %{
            "invocation" =>
              "4028b933b66597e55f7099bf3a5ab633fb9322ed3061e520ceaa5e8e175ae2c8054b86c664f56a5bfd00a6fcf5d2f76bcb6805df187c2f7ac4569b5bc42c041309",
            "verification" =>
              "21039f07df7861c216de3b78c647b77f8b01404b400a437302b651cdf206ec1af626ac"
          }
        ],
        "size" => 202,
        "sys_fee" => "0",
        "hash" =>
          <<6, 198, 226, 70, 153, 209, 47, 164, 221, 24, 72, 212, 189, 164, 28, 93, 188, 70, 111,
            81, 221, 85, 10, 148, 213, 216, 232, 219, 208, 30, 53, 185>>,
        "type" => "ContractTransaction",
        "version" => 0,
        "vin" => [
          %{
            "txid" => "0xee85d489e4428a538f39c1903771e1f222a383f8327c96ed19cc02079149a1fd",
            "vout" => 0
          }
        ],
        "vout" => [
          %{
            "address" => "AQVh2pG732YvtNaxEGkQUei3YA4cvo7d2i",
            "asset" => "0xc56f33fc6ecfcd0c225c4ab356fee59390af8560be0e930faebe74a6daff7c9b",
            "n" => 0,
            "value" => "1000"
          }
        ]
      }
    ],
    "version" => 0
  }

  @block4275 %{
    "confirmations" => 2_332_861,
    "hash" =>
      <<16, 163, 254, 109, 130, 233, 190, 24, 90, 109, 210, 202, 232, 92, 71, 242, 216, 14, 87,
        148, 42, 125, 58, 151, 192, 152, 106, 79, 162, 165, 152, 50>>,
    "index" => 4275,
    "merkleroot" => "0x4a196d5cfc6e0979bc1071bf549aec28e01634a377862175280d2117c027d323",
    "nextblockhash" => "0x120ea1b72ad38ff81e53a9f18f6c8c56ff746d3eace29d52900be83002d95de4",
    "nextconsensus" => "APyEx5f4Zm4oCHwFWiSTaph1fPBxZacYVR",
    "nonce" => "9808fd2e1d822bc4",
    "previousblockhash" => "0xb4925de0a488e22ac3767d3889ce3802d22db2d2a470c61de23ef16584d70e3e",
    "script" => %{
      "invocation" =>
        "401952c2ec6861bd7bc9e06111a7a1f7cbc5fd4e41da7596ff9c3abeff8e47a2b56616fe95130ebfe27b7058d0bca5c881fa16a5a59dec026a681e3e6173fde07640b70dc3f602adb29ad0c47e297038db141b1df30a37b23879645824786871cfadea72f958b3652638b541d3ffcb87c9e3ab0f5d1a28f38a808ccd4c188bc5a0b7400bc4c4569ad6169cd80944de17dea6d5a580df9589e3adf6b3ce6a00c0310e8f7d050cbe882cdc86902d1ee9ace6dcdbdf3b39f7b4ee4de1ca394907c811f21d404afbd86d18e1ce117a569674649c2fbbced4d441538bac1e4c8fefaedfd10b260b233b9675119bbdc26194ac5fdeb7b9111445318a2661fe1f0776d7d8302bf040dd6b81d6eca9e6b93f28ef0ac302a467bb4649bb7021382648a59905c5aa81bb371b6fc83ed8b31badabdc4b11199e9cf6920c8e7cb45b39e9dfa3c149abefba",
      "verification" =>
        "552102486fd15702c4490a26703112a5cc1d0923fd697a33406bd5a1c00e0013b09a7021024c7b7fb6c310fccf1ba33b082519d82964ea93868d676662d4a59ad548df0e7d2102aaec38470f6aad0042c6e877cfd8087d2676b0f516fddd362801b9bd3936399e2103b209fd4f53a7170ea4444e0cb0a6bb6a53c2bd016926989cf85f9b0fba17a70c2103b8d9d5771d8f513aa0869b9cc8d50986403b78c6da36890638c3d46a5adce04a2102ca0e27697b9c248f6f16e085fd0061e26f44da85b58ee835c110caa5ec3ba5542102df48f60e8f3e01c48ff40b9b7f1310d7a8b2a193188befe1c2e3df740e89509357ae"
    },
    "size" => 889,
    "time" => 1_476_727_269,
    "transfers" => [],
    "tx" => [
      %{
        "attributes" => [],
        "net_fee" => "0",
        "nonce" => 495_070_148,
        "scripts" => [],
        "size" => 10,
        "sys_fee" => "0",
        "hash" =>
          <<32, 57, 138, 200, 48, 28, 224, 172, 213, 64, 104, 187, 37, 244, 216, 230, 18, 53, 111,
            6, 222, 201, 237, 197, 200, 64, 204, 210, 78, 63, 182, 247>>,
        "type" => "MinerTransaction",
        "version" => 0,
        "vin" => [],
        "vout" => []
      },
      %{
        "attributes" => [],
        "claims" => [
          %{
            "txid" => "0xee85d489e4428a538f39c1903771e1f222a383f8327c96ed19cc02079149a1fd",
            "vout" => 0
          }
        ],
        "net_fee" => "0",
        "scripts" => [
          %{
            "invocation" =>
              "4019fcb645e67b870a657fe028bcb057f866347d211dc26a25fe0570250f41d0c881113e1820ac55a029e6fc5acab80587f9bebf8b84dbd4503ba816c417b8bf52",
            "verification" =>
              "21039f07df7861c216de3b78c647b77f8b01404b400a437302b651cdf206ec1af626ac"
          }
        ],
        "size" => 203,
        "sys_fee" => "0",
        "hash" =>
          <<70, 44, 14, 111, 205, 104, 133, 61, 212, 79, 64, 85, 226, 170, 117, 149, 72, 3, 141,
            59, 19, 98, 182, 24, 35, 152, 166, 212, 76, 13, 27, 240>>,
        "type" => "ClaimTransaction",
        "version" => 0,
        "vin" => [],
        "vout" => [
          %{
            "address" => "Ae2d6qj91YL3LVUMkza7WQsaTYjzjHm4z1",
            "asset" => "0x602c79718b16e442de58778e148d0b1084e3b2dffd5de6b7b16cee7969282de7",
            "n" => 0,
            "value" => "0.01144"
          }
        ]
      }
    ],
    "version" => 0
  }

  @block4292 %{
    "confirmations" => 2_332_846,
    "hash" =>
      <<116, 165, 66, 30, 49, 165, 82, 78, 89, 227, 218, 248, 163, 154, 182, 94, 135, 102, 101,
        205, 129, 160, 62, 192, 56, 57, 216, 140, 173, 141, 26, 233>>,
    "index" => 4292,
    "merkleroot" => "0x9441abd0827429a6e5f8efa037916e9891958336add2e876a1f0553459bd02e3",
    "nextblockhash" => "0xcf6b92a1c886087f1c7af61f412b711c605ebe8ca4494e09051960cf03cf8063",
    "nextconsensus" => "APyEx5f4Zm4oCHwFWiSTaph1fPBxZacYVR",
    "nonce" => "e8bdd45e4d220e74",
    "previousblockhash" => "0x5c02239d0b3b16f1e6cd12154972bb0a191eba309c48ae4d7b1c7b607b91f9ce",
    "script" => %{
      "invocation" =>
        "40a0153d6d702666619a2451dcecc9d8662096f013d60e592bcb7f520dbd47d1a23ac942009ff1d757d9470f40e901feded4586ded32b612349fb3bfb5f06dd33f40068ea53cf82a1b64ae2ef1146c709b33b8299ce80e06676b9e6d9ef1f1cc753c7b41aea59f21e8a331ac6209ad402ae57335a8344836b295975dbe9355dbe18f403ac7157d07c902785f163e6ba69fac34b113b1cc154db933ab19f62c56b4a5a53b7607b10dff82ac2763fcc1b31dfad014a62db7287c30cd16bd8ffa47c99d5f409388d9ca0e08f712026cd1d9f092f20e66e6122c12d6ad96e6e8b63e03fa2e6e94742d443109ae7f4736780684fd34479efd73143f4c12dd90f484d9909351914050ec327688955b1fb8d5f0b60df065d47a4a4f79844064dd59fd4e8fbb3a606df78f90d2adc77486f0647b84819dbdc0dca10794f6100aceb5c1975b7597534d",
      "verification" =>
        "552102486fd15702c4490a26703112a5cc1d0923fd697a33406bd5a1c00e0013b09a7021024c7b7fb6c310fccf1ba33b082519d82964ea93868d676662d4a59ad548df0e7d2102aaec38470f6aad0042c6e877cfd8087d2676b0f516fddd362801b9bd3936399e2103b209fd4f53a7170ea4444e0cb0a6bb6a53c2bd016926989cf85f9b0fba17a70c2103b8d9d5771d8f513aa0869b9cc8d50986403b78c6da36890638c3d46a5adce04a2102ca0e27697b9c248f6f16e085fd0061e26f44da85b58ee835c110caa5ec3ba5542102df48f60e8f3e01c48ff40b9b7f1310d7a8b2a193188befe1c2e3df740e89509357ae"
    },
    "size" => 1325,
    "time" => 1_476_727_588,
    "transfers" => [],
    "tx" => [
      %{
        "attributes" => [],
        "net_fee" => "0",
        "nonce" => 1_294_077_556,
        "scripts" => [],
        "size" => 10,
        "sys_fee" => "0",
        "hash" =>
          <<66, 7, 193, 42, 28, 1, 219, 99, 41, 8, 241, 236, 109, 11, 182, 241, 199, 186, 110, 42,
            20, 99, 249, 182, 107, 92, 241, 191, 66, 180, 234, 228>>,
        "type" => "MinerTransaction",
        "version" => 0,
        "vin" => [],
        "vout" => []
      },
      %{
        "attributes" => [],
        "net_fee" => "0",
        "scripts" => [
          %{
            "invocation" =>
              "4072a783f95ba0229d0df0cbf748a834c110f76412ed4bbc5fe993c7b69ba9cb2c8d7f445b3a7d7882520ed6d6aab272d452fc1f1ce337f29efc5fad54ec1a5c21400dbe6c442b4f370a26258e4f2a8aab1ce8f4c07b81aa6750df63a5f460b610d93388d7b3c8464a280a7d882a6e05ac70b70b5efd7f573600850a8954b64ef15340a6896dc11ebdd716afa664a2847a9b6c1b845a00160d091dc290877eebed9089cb6d0402352549ad18fd26b5ce3ee0fea5ce162565c3e7b831d53e9659d204dd405f92fc2b844cbcd747d61dc980671cea3950b01add4db4e48031cbb8c0e13cee9b16d933be5b8a8942995a30ae49b024824cf57b94249fa4aabd4e75ba171e79",
            "verification" =>
              "542102486fd15702c4490a26703112a5cc1d0923fd697a33406bd5a1c00e0013b09a7021024c7b7fb6c310fccf1ba33b082519d82964ea93868d676662d4a59ad548df0e7d2102aaec38470f6aad0042c6e877cfd8087d2676b0f516fddd362801b9bd3936399e2103b209fd4f53a7170ea4444e0cb0a6bb6a53c2bd016926989cf85f9b0fba17a70c2103b8d9d5771d8f513aa0869b9cc8d50986403b78c6da36890638c3d46a5adce04a2102ca0e27697b9c248f6f16e085fd0061e26f44da85b58ee835c110caa5ec3ba5542102df48f60e8f3e01c48ff40b9b7f1310d7a8b2a193188befe1c2e3df740e89509357ae"
          }
        ],
        "size" => 639,
        "sys_fee" => "0",
        "hash" =>
          <<242, 201, 19, 119, 126, 41, 9, 7, 93, 112, 154, 175, 73, 162, 167, 15, 153, 154, 126,
            107, 66, 207, 191, 29, 202, 98, 191, 30, 33, 252, 249, 57>>,
        "type" => "ContractTransaction",
        "version" => 0,
        "vin" => [
          %{
            "txid" => "0x32e3a4f92adee2acf0e0455af8db089398a08dc8a3228b51c5465328ff8756c4",
            "vout" => 0
          },
          %{
            "txid" => "0x06c6e24699d12fa4dd1848d4bda41c5dbc466f51dd550a94d5d8e8dbd01e35b9",
            "vout" => 0
          }
        ],
        "vout" => [
          %{
            "address" => "AQVh2pG732YvtNaxEGkQUei3YA4cvo7d2i",
            "asset" => "0xc56f33fc6ecfcd0c225c4ab356fee59390af8560be0e930faebe74a6daff7c9b",
            "n" => 0,
            "value" => "100000000"
          }
        ]
      }
    ],
    "version" => 0
  }

  @fake_block4299 %{
    "confirmations" => 2_332_842,
    "hash" =>
      <<254, 130, 163, 191, 91, 134, 192, 241, 15, 197, 89, 138, 24, 224, 186, 44, 31, 40, 222,
        251, 48, 87, 147, 183, 8, 83, 250, 72, 6, 144, 206, 73>>,
    "index" => 4299,
    "merkleroot" => "0xd28b0da6a97c4ffce6f2e1878a83d5ee00e60c2bdfbbbdb61996a226b6cfb305",
    "nextblockhash" => "0x9d30c3b5bfe701003b7af36a58df110d97c862d0d2a08cef31a6650a038dd7f0",
    "nextconsensus" => "APyEx5f4Zm4oCHwFWiSTaph1fPBxZacYVR",
    "nonce" => "6f3bc8381bb3dc7c",
    "previousblockhash" => "0x710d00756e6e72585b332e52a32ec03ac874e1259abafaa2375095a6c27b9ab9",
    "script" => %{
      "invocation" =>
        "40d4c2419b371af9ad44df233b3585edd233deec83a08af339c630fa9dace46256a7376f635b5186f85be8f14367df9b7c48b99e90133c14d53a8acbc62dd08e6a402541b6ec8d125f55dfcc6bac20e134c025f54094b4e6070329381ad5c429c834b9904699dcade0007c6cdf49e005654c8bd202a100e7bd22880a13b0753c3fd6400c2c14306cfa99b752579e86f8ae0273d7df7a9aac1dd89699b025234ed7435942296b2bf46d2c112ad45a68f027139e70e82da3e3d032aea30f575cf0da5b5840088e3891548d1199d5894de0c6f02a1aeffac64c9521d67ab270dea42be2534999cbf6be81b56fd6997f249b9a9b32aaa6667f013b7540a5986af1535fc8c6654078edc3d2b852806a9e1f5dd1282eda4090c11595fa848bc47c2daebc0e306dd9f23a84b8d2dc01a290b87ed858664f009c7441f578373a5f4d52ace31812873a",
      "verification" =>
        "552102486fd15702c4490a26703112a5cc1d0923fd697a33406bd5a1c00e0013b09a7021024c7b7fb6c310fccf1ba33b082519d82964ea93868d676662d4a59ad548df0e7d2102aaec38470f6aad0042c6e877cfd8087d2676b0f516fddd362801b9bd3936399e2103b209fd4f53a7170ea4444e0cb0a6bb6a53c2bd016926989cf85f9b0fba17a70c2103b8d9d5771d8f513aa0869b9cc8d50986403b78c6da36890638c3d46a5adce04a2102ca0e27697b9c248f6f16e085fd0061e26f44da85b58ee835c110caa5ec3ba5542102df48f60e8f3e01c48ff40b9b7f1310d7a8b2a193188befe1c2e3df740e89509357ae"
    },
    "size" => 1496,
    "time" => 1_476_727_718,
    "transfers" => [
      %{
        "addr_from" => "AFmseVrdL9f9oyCzZefL9tG6UbvhPbdYzM",
        "addr_to" => "ATuT3d1cM4gtg6HezpFrgMppAV3wC5Pjd9",
        "amount" => 5_065_200_000_000_000,
        "block" => 1_444_843,
        "contract" => "0xecc6b20d3ccac1ee9ef109af5a7cdb85706b1df9",
        "notify_type" => "transfer",
        "tx" => "0xc920b2192e74eda4ca6140510813aa40fef1767d00c152aa6f8027c24bdf14f2",
        "type" => "SmartContract.Runtime.Notify"
      },
      %{
        "addr_from" => "AFmseVrdL9f9oyCzZefL9tG6UbvhPbdYzM",
        "addr_to" => "AHWaJejUjvez5R6SW5kbWrMoLA9vSzTpW9",
        "amount" => 9_096_780_000_000_000,
        "block" => 1_444_843,
        "contract" => "0xecc6b20d3ccac1ee9ef109af5a7cdb85706b1df9",
        "notify_type" => "transfer",
        "tx" => "0xc920b2192e74eda4ca6140510813aa40fef1767d00c152aa6f8027c24bdf14f2",
        "type" => "SmartContract.Runtime.Notify"
      },
      %{
        "addr_from" => "AFmseVrdL9f9oyCzZefL9tG6UbvhPbdYzM",
        "addr_to" => "AN8cLUwpv7UEWTVxXgGKeuWvwoT2psMygA",
        "amount" => 3_500_000_000_000_000,
        "block" => 1_444_843,
        "contract" => "0xecc6b20d3ccac1ee9ef109af5a7cdb85706b1df9",
        "notify_type" => "transfer",
        "tx" => "0xc920b2192e74eda4ca6140510813aa40fef1767d00c152aa6f8027c24bdf14f2",
        "type" => "SmartContract.Runtime.Notify"
      }
    ],
    "tx" => [
      %{
        "attributes" => [],
        "net_fee" => "0",
        "nonce" => 464_772_220,
        "scripts" => [],
        "size" => 10,
        "sys_fee" => "0",
        "hash" =>
          <<98, 66, 157, 250, 33, 190, 113, 135, 160, 189, 17, 110, 173, 245, 179, 169, 76, 227,
            147, 88, 136, 51, 102, 42, 93, 169, 117, 111, 177, 52, 250, 89>>,
        "type" => "MinerTransaction",
        "version" => 0,
        "vin" => [],
        "vout" => []
      },
      %{
        "attributes" => [],
        "claims" => [
          %{
            "txid" => "0x3631f66024ca6f5b033d7e0809eb993443374830025af904fb51b0334f127cda",
            "vout" => 0
          },
          %{
            "txid" => "0xee85d489e4428a538f39c1903771e1f222a383f8327c96ed19cc02079149a1fd",
            "vout" => 1
          },
          %{
            "txid" => "0x32e3a4f92adee2acf0e0455af8db089398a08dc8a3228b51c5465328ff8756c4",
            "vout" => 0
          },
          %{
            "txid" => "0x06c6e24699d12fa4dd1848d4bda41c5dbc466f51dd550a94d5d8e8dbd01e35b9",
            "vout" => 0
          }
        ],
        "net_fee" => "0",
        "scripts" => [
          %{
            "invocation" =>
              "402aa06eadb65b126b4e461f624253e9a424e30c78b792f6c806afc4d372f06e1e24ade2b2f8d371beed438bfb6a96ea94921eb9ca02eecfc0ed91480fec2d83f8400f7ddf8daa2857997f0ab19667d855e3a2612e5172b9b724ab706064f322f53a1d7a2f73d5d2e111a56d89596d05c81f847912323afd0e373deaf1f3a5e44eaf40d7bb4393772a5c55ee1f2abffd49ace8634bbadc76435bbf9f98eb183aaf67550f26794a44636f75e9101ab70e62404af71ca28543f69c900227c683aaf57c0d403a3b7943e883437ad84a9237654c8816f0e780bfbcac11c6e1d5bffae856b14385a4fce4aa5869c256776105ea808cc7b7ffa76a37cab3e4fe314f94daf1de32",
            "verification" =>
              "542102486fd15702c4490a26703112a5cc1d0923fd697a33406bd5a1c00e0013b09a7021024c7b7fb6c310fccf1ba33b082519d82964ea93868d676662d4a59ad548df0e7d2102aaec38470f6aad0042c6e877cfd8087d2676b0f516fddd362801b9bd3936399e2103b209fd4f53a7170ea4444e0cb0a6bb6a53c2bd016926989cf85f9b0fba17a70c2103b8d9d5771d8f513aa0869b9cc8d50986403b78c6da36890638c3d46a5adce04a2102ca0e27697b9c248f6f16e085fd0061e26f44da85b58ee835c110caa5ec3ba5542102df48f60e8f3e01c48ff40b9b7f1310d7a8b2a193188befe1c2e3df740e89509357ae"
          },
          %{
            "invocation" =>
              "409f671b58a85cf2b191c6454326aaa8aa6136f61e69c0ae6c19a664f09a76c6dff1716687b371b7cfcd974a57545469b4b90395e94b1cb182f5d116909032252b",
            "verification" =>
              "2103b209fd4f53a7170ea4444e0cb0a6bb6a53c2bd016926989cf85f9b0fba17a70cac"
          }
        ],
        "size" => 810,
        "sys_fee" => "0",
        "hash" =>
          <<211, 122, 204, 94, 11, 133, 30, 151, 207, 173, 115, 222, 98, 145, 39, 182, 236, 55,
            35, 67, 165, 107, 119, 233, 189, 135, 169, 137, 77, 72, 210, 212>>,
        "type" => "ClaimTransaction",
        "version" => 0,
        "vin" => [],
        "vout" => [
          %{
            "address" => "AWHX6wX5mEJ4Vwg7uBcqESeq3NggtNFhzD",
            "asset" => "0x602c79718b16e442de58778e148d0b1084e3b2dffd5de6b7b16cee7969282de7",
            "n" => 0,
            "value" => "34334.98856"
          }
        ]
      }
    ],
    "version" => 0
  }

  describe "blocks" do
    alias Neoscan.Blocks.Block

    test "home_blocks/0" do
      block = insert(:block)
      [block1] = Blocks.home_blocks()
      assert block.hash == block1.hash
    end

    test "paginate_blocks/1" do
      for _ <- 1..20, do: insert(:block)
      assert 15 == Enum.count(Blocks.paginate_blocks(1))
      assert 5 == Enum.count(Blocks.paginate_blocks(2))
      assert 0 == Enum.count(Blocks.paginate_blocks(3))
    end

    test "list_blocks/0 returns all blocks" do
      block = insert(:block)
      assert Blocks.list_blocks() == [block]
    end

    test "get_block!/1 returns the block with given id" do
      block = insert(:block)
      assert Blocks.get_block!(block.hash) == block
    end

    test "get_block_by_hash/1" do
      block = insert(:block)
      assert block.hash == Blocks.get_block_by_hash(block.hash).hash
    end

    test "get_block_by_hash_for_view/1" do
      block = insert(:block)
      assert block.hash == Blocks.get_block_by_hash_for_view(block.hash).hash
    end

    test "paginate_transactions/2" do
      block = insert(:block)
      insert(:transaction, %{block_hash: block.hash})
      {_, transactions} = Blocks.paginate_transactions(block.hash, 1)
      assert 1 == Enum.count(transactions)
    end

    test "get_block_by_height/1" do
      block = insert(:block)
      assert block.hash == Blocks.get_block_by_height(block.index).hash
      assert is_nil(Blocks.get_block_by_height(12355))
    end

    test "get_block_time/1" do
      assert 1_476_649_675 == Blocks.get_block_time(123)
    end

    test "create_block/1 with valid data creates a block" do
      block = insert(:block)
      assert block.confirmations == 50
      assert byte_size(block.hash) == 32
      assert String.length(block.merkleroot) > 64
      assert String.length(block.nextblockhash) > 64
      assert String.length(block.nextconsensus) > 64
      assert String.contains?(block.nonce, "nonce")
      assert String.length(block.previousblockhash) > 64
      assert %{} = block.script
      assert block.size == 1526
      assert block.time == 15_154_813
      assert block.version == 2
    end

    test "get_higher_than/1" do
      block1 = insert(:block)
      %{hash: block_hash} = insert(:block)
      assert [%{hash: ^block_hash}] = Blocks.get_higher_than(block1.index)
    end

    test "delete_higher_than/1" do
      block1 = insert(:block)
      %{hash: block_hash, index: index} = insert(:block)
      assert [] == Blocks.delete_higher_than(index)
      assert [%{hash: ^block_hash}] = Blocks.get_higher_than(index - 1)

      assert block_hash ==
               block1.index
               |> Blocks.delete_higher_than()
               |> List.first()
               |> Map.get(:hash)

      assert [] = Blocks.get_higher_than(index)
    end

    test "update_block/2 with valid data updates the block" do
      block = insert(:block)

      assert {:ok, block} =
               Blocks.update_block(block, %{
                 "confirmations" => 57,
                 "hash" => "b33f6f3dfead7dddpo99846bf5dda8aibbbc92cb57f161b5030ae608317c6fa8",
                 "merkleroot" =>
                   "b33f6f3dfead7ddpe999846bf5dda8aibbbc92cb57f161b5030ae608317c6fa8",
                 "nextblockhash" =>
                   "b33f6f3dfead7ddde999846bf5dda8aibbbc92cb57f161b5030ae608317c6fa8",
                 "previousblockhash" =>
                   "b33f6f3dfpad7ddde999846bf5dda8aibbbc92cb57f161b5030ae608317c6fa8",
                 "index" => 1
               })

      assert block.confirmations == 57
    end

    test "update_block/2 with invalid data returns error changeset" do
      block = insert(:block)
      assert {:error, %Ecto.Changeset{}} = Blocks.update_block(block, %{"confirmations" => nil})
      assert block == Blocks.get_block!(block.hash)
    end

    test "delete_block/1 deletes the block" do
      block = insert(:block)
      assert %Block{} = Blocks.delete_block(block)
      assert_raise Ecto.NoResultsError, fn -> Blocks.get_block!(block.hash) end
    end

    test "add_block/1" do
      assert :ok == Blocks.add_block(@block0)
      assert :ok == Blocks.add_block(@block4130)
      assert :ok == Blocks.add_block(@block4159)
      assert :ok == Blocks.add_block(@block4273)
      assert :ok == Blocks.add_block(@block4275)
      assert :ok == Blocks.add_block(@block4292)
      assert :ok == Blocks.add_block(@fake_block4299)
    end

    test "compute_fees/1" do
      block = %{
        "tx" => [
          %{"sys_fee" => "123.4", "net_fee" => "error"},
          %{"sys_fee" => "error", "net_fee" => "567.8"}
        ]
      }

      assert %{"total_sys_fee" => 123.4, "total_net_fee" => 567.8, "tx" => block["tx"]} ==
               Blocks.compute_fees(block)
    end
  end
end
