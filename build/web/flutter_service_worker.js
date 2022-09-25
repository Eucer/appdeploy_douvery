'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "c9be26b8fe07b2ff5356f055275c89cb",
"assets/FontManifest.json": "54a9efee04ea50414c7c0f16a23f2699",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/NOTICES": "83c1a404be2e1357043811b2b512329e",
"assets/packages/animated_snack_bar/assets/monochrome/check-circle.svg": "f6d9dd67711da5b6d4d965f66c10cd07",
"assets/packages/animated_snack_bar/assets/monochrome/comment-dots.svg": "44311bf381ea1155bfe38c40d44c577a",
"assets/packages/animated_snack_bar/assets/monochrome/exclamation-circle.svg": "63ffc503c8e024f9752866e021afb744",
"assets/packages/animated_snack_bar/assets/monochrome/exclamation-octagon.svg": "ab5fb6de2478b95f911cebb5cf6af9c3",
"assets/packages/animated_snack_bar/assets/monochrome/exclamation-triangle.svg": "10427de487dc532646c4a11f6be3fe84",
"assets/packages/animated_snack_bar/assets/regular/check-circle.svg": "0936541fbbf9ebf325169373c2d2439a",
"assets/packages/animated_snack_bar/assets/regular/exclamation-circle.svg": "69c777fe5b9ffd2f8286ca47f98d1a31",
"assets/packages/animated_snack_bar/assets/regular/exclamation-triangle.svg": "57a895d149648e4b69c7681d4efb2052",
"assets/packages/animated_snack_bar/assets/regular/info-circle.svg": "e733e8ecda8758e6b69d20cc1ca1c6c4",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/elegant_notification/assets/icons/error.png": "2a84d22ca4a8d9123f1e3149121b0976",
"assets/packages/elegant_notification/assets/icons/info.png": "84b36b60ddacca6c063112fd636bdefb",
"assets/packages/elegant_notification/assets/icons/success.png": "a27784120d6634f48b24e12c4604f9d9",
"assets/packages/eva_icons_flutter/lib/fonts/Eva-Icons.ttf": "a71dbd49ad4a52020638190e30ac52e0",
"assets/packages/flutter_iconly/fonts/IconlyBroken.ttf": "541df649654f074a25833daa64e246f3",
"assets/packages/flutter_iconly/fonts/IconlyLight.ttf": "25d014c0a013024ffb898071af3bff6c",
"assets/packages/flutter_iconly/fonts/iconly_bold.ttf": "20ae062785ef7ebe5d2eaaf4ddbb8e3a",
"assets/packages/iconsax/lib/assets/fonts/iconsax.ttf": "071d77779414a409552e0584dcbfd03d",
"assets/packages/pay_android/assets/ar/add_to.svg": "68d78045fe1fffd74fe47f4a29b2a427",
"assets/packages/pay_android/assets/ar/book_with.svg": "9e3a15fa087dfa8ab5c95577a504125f",
"assets/packages/pay_android/assets/ar/buy_with.svg": "9828d8a5a5c5e860a9c0ed6d502ecd9a",
"assets/packages/pay_android/assets/ar/checkout_with.svg": "2cf67466b34fada10c0ff693438adde8",
"assets/packages/pay_android/assets/ar/donate_with.svg": "2d9a8344409330f310d6e098212f8e86",
"assets/packages/pay_android/assets/ar/order_with.svg": "014b4acf694733db5560b40e93a8773b",
"assets/packages/pay_android/assets/ar/pay_with.svg": "9324e9688c2c3563b1aac257c55b332f",
"assets/packages/pay_android/assets/ar/subscribe_with.svg": "bbc5ab1254c834e3ad50142802732370",
"assets/packages/pay_android/assets/bg/add_to.svg": "17ca05b123a4c3d64ec032a41875ab41",
"assets/packages/pay_android/assets/bg/book_with.svg": "2a38f23b87e4b55bf498b61026b3dd04",
"assets/packages/pay_android/assets/bg/buy_with.svg": "681850b53f3f1680b33f970c0250a750",
"assets/packages/pay_android/assets/bg/checkout_with.svg": "2b8d63fc4636093ec3c8c7cefcd156af",
"assets/packages/pay_android/assets/bg/donate_with.svg": "c5b2eb3920fedf5dcad83fa4c30c817e",
"assets/packages/pay_android/assets/bg/order_with.svg": "b70e82856b7966b21bdf8433d3153f22",
"assets/packages/pay_android/assets/bg/pay_with.svg": "317d4d5111d4ad4c6702144652db14c2",
"assets/packages/pay_android/assets/bg/subscribe_with.svg": "664e314a9401ed1817ee4c0812f72632",
"assets/packages/pay_android/assets/ca/add_to.svg": "5ce822e74e207e40e6432cecb18e614b",
"assets/packages/pay_android/assets/ca/book_with.svg": "3b14295758a4242d5c298c6cf97061a0",
"assets/packages/pay_android/assets/ca/buy_with.svg": "99fef5027c4f2178c8807e2618252a38",
"assets/packages/pay_android/assets/ca/checkout_with.svg": "0208700e968fa9842d118a4cbf7cae83",
"assets/packages/pay_android/assets/ca/donate_with.svg": "f3df2bb3d2749d0c9739b2497168f00e",
"assets/packages/pay_android/assets/ca/order_with.svg": "a51dec487a696e1717bed6d91110d82b",
"assets/packages/pay_android/assets/ca/pay_with.svg": "0f6fbb7dbe57f8743244b6facc9b2f2e",
"assets/packages/pay_android/assets/ca/subscribe_with.svg": "42a8215967dd4e3135ea5f45ad5b5409",
"assets/packages/pay_android/assets/cs/add_to.svg": "6d81b51062de8f50a78a894dd0a1f615",
"assets/packages/pay_android/assets/cs/book_with.svg": "7a4623865e0833b7d7946cd367d9bdb9",
"assets/packages/pay_android/assets/cs/buy_with.svg": "8620a6648b29a9fa58cc3cc0cbdee343",
"assets/packages/pay_android/assets/cs/checkout_with.svg": "80db31e271199b3fe8e3c8ecda21bd93",
"assets/packages/pay_android/assets/cs/donate_with.svg": "1f6536a413fc8b2688938f4b7c62f6c2",
"assets/packages/pay_android/assets/cs/order_with.svg": "bb08acff12ddd7ddac7871ca025b2431",
"assets/packages/pay_android/assets/cs/pay_with.svg": "9de2c26db512d92786ce3444df48bba1",
"assets/packages/pay_android/assets/cs/subscribe_with.svg": "fc0fe63fe043594f83dfc926dad10d03",
"assets/packages/pay_android/assets/da/add_to.svg": "d92a6bc7db33fda96c29fda5ba616a83",
"assets/packages/pay_android/assets/da/book_with.svg": "ee368d45b04e4c6ebf678f86bc62b7bb",
"assets/packages/pay_android/assets/da/buy_with.svg": "785e848cf8c9c762d085aa871d8d7410",
"assets/packages/pay_android/assets/da/checkout_with.svg": "d9f8ab3a339a1ad79b51d63e3130567b",
"assets/packages/pay_android/assets/da/donate_with.svg": "cf378b633e41e235b1350055cc97eeda",
"assets/packages/pay_android/assets/da/order_with.svg": "21e745b5861635499942889d99cdeffa",
"assets/packages/pay_android/assets/da/pay_with.svg": "dcab745dfb348a6270259cb5915153b5",
"assets/packages/pay_android/assets/da/subscribe_with.svg": "5047cf4f6315ff4e10a5947adf94efb0",
"assets/packages/pay_android/assets/de/add_to.svg": "f8a091aa3526391479087368eff94059",
"assets/packages/pay_android/assets/de/book_with.svg": "c50d34aabdf5f8614e0fbae3596d9ac2",
"assets/packages/pay_android/assets/de/buy_with.svg": "f754c418b05447dc0df319af21deffb2",
"assets/packages/pay_android/assets/de/checkout_with.svg": "8d6a7a750f7ba2aa300b90767dd07eb8",
"assets/packages/pay_android/assets/de/donate_with.svg": "4914084db3ff67c67193771f67e55444",
"assets/packages/pay_android/assets/de/order_with.svg": "d1dc943018db9f27399f1ebd4ca447b8",
"assets/packages/pay_android/assets/de/pay_with.svg": "b2225cf95901601945b40f99b4f7ff43",
"assets/packages/pay_android/assets/de/subscribe_with.svg": "17564aaa647332fba304d2d8ef62bb1b",
"assets/packages/pay_android/assets/el/add_to.svg": "e7943d08bb521077313bb7333c8ee87f",
"assets/packages/pay_android/assets/el/book_with.svg": "232425855bbbec477ac75fc6201eb658",
"assets/packages/pay_android/assets/el/buy_with.svg": "c572bb24c6f8fd7b407e828fe765bcd1",
"assets/packages/pay_android/assets/el/checkout_with.svg": "ff4d7e33f2fb9d45cd81b477982086d2",
"assets/packages/pay_android/assets/el/donate_with.svg": "db2d3ecc06967c60aa1494065ba6b112",
"assets/packages/pay_android/assets/el/order_with.svg": "3d3d3b64d4ccb81c49140382562b890a",
"assets/packages/pay_android/assets/el/pay_with.svg": "b46ee5b6236b73184cc752c91877acd6",
"assets/packages/pay_android/assets/el/subscribe_with.svg": "3892ae846e04df415254e02643b76525",
"assets/packages/pay_android/assets/en/add_to.svg": "c1bc5877a9e2886311b0bbe2a78cb1df",
"assets/packages/pay_android/assets/en/book_with.svg": "f1d051fd124907c5925f690313642100",
"assets/packages/pay_android/assets/en/buy_with.svg": "746e508afbe124ecee51e6805705d840",
"assets/packages/pay_android/assets/en/checkout_with.svg": "48303924df98f31d6e74b192b659ed2b",
"assets/packages/pay_android/assets/en/donate_with.svg": "ac7e1e899237d80f3de63c037f8b1e3e",
"assets/packages/pay_android/assets/en/order_with.svg": "d61e5e067227ce9a19eecb48c276d0a0",
"assets/packages/pay_android/assets/en/pay_with.svg": "9ec84a697747c32353f4d4a47a4f65fe",
"assets/packages/pay_android/assets/en/subscribe_with.svg": "13338a44a4414b97b68c513ab5ef6ffc",
"assets/packages/pay_android/assets/es/add_to.svg": "5e1355ae1b7659728c9ef75ce493d9e9",
"assets/packages/pay_android/assets/es/book_with.svg": "34db8f394f368a8e03ed0abd7d69fcec",
"assets/packages/pay_android/assets/es/buy_with.svg": "0448cda0cbfd85a1273194152012b774",
"assets/packages/pay_android/assets/es/checkout_with.svg": "1e235642b81d8b6ae92eecd688eac24c",
"assets/packages/pay_android/assets/es/donate_with.svg": "b054132090848644db1dc7078cd9a8c5",
"assets/packages/pay_android/assets/es/order_with.svg": "f212e0fafa51de5aaa362e66c476d947",
"assets/packages/pay_android/assets/es/pay_with.svg": "9921e330c6a6bfdee41a0f64d9d6998f",
"assets/packages/pay_android/assets/es/subscribe_with.svg": "ca7000156d48017c3bc6ecc8cda2bb97",
"assets/packages/pay_android/assets/et/add_to.svg": "b88ca15b4e6722d753840566d441c33e",
"assets/packages/pay_android/assets/et/book_with.svg": "049ed3012d315deadbe05d3eb58772a3",
"assets/packages/pay_android/assets/et/buy_with.svg": "8a9dca34ca0aedaed2a27ca4fca20bf9",
"assets/packages/pay_android/assets/et/checkout_with.svg": "22022a77107fa184c7ed2c70d0258665",
"assets/packages/pay_android/assets/et/donate_with.svg": "761284824f888f7bf5c5d4ca5a38ff95",
"assets/packages/pay_android/assets/et/order_with.svg": "d4243c1f7258d18b989d0be86c7df8b6",
"assets/packages/pay_android/assets/et/pay_with.svg": "c770b65139ed858e0101ba234e5e52d0",
"assets/packages/pay_android/assets/et/subscribe_with.svg": "38898d3970fb21a449381d9a7874877b",
"assets/packages/pay_android/assets/fi/add_to.svg": "27475a2afa900c8c213cee14b031ac45",
"assets/packages/pay_android/assets/fi/book_with.svg": "062bc8a8698494962ad6f80be0f72064",
"assets/packages/pay_android/assets/fi/buy_with.svg": "dbffd9f6838c0c7015f56b4ca6e2973d",
"assets/packages/pay_android/assets/fi/checkout_with.svg": "f1053427d6a1ed38c82165da295ae55d",
"assets/packages/pay_android/assets/fi/donate_with.svg": "51ecef133092b7f3ec375fecd6978c9d",
"assets/packages/pay_android/assets/fi/order_with.svg": "748d6674d9441d8ac19ccab303ec7abe",
"assets/packages/pay_android/assets/fi/pay_with.svg": "403b06e4c62fa40adab9a6f73b981969",
"assets/packages/pay_android/assets/fi/subscribe_with.svg": "506797abab6aede6f294170c1466dedd",
"assets/packages/pay_android/assets/fr/add_to.svg": "bb8e7485548aa8151f77ef0575106c44",
"assets/packages/pay_android/assets/fr/book_with.svg": "43339eec255db0b9717f9db53821c5af",
"assets/packages/pay_android/assets/fr/buy_with.svg": "7c13503ee92f1b65172b25339f5f0e1f",
"assets/packages/pay_android/assets/fr/checkout_with.svg": "ea2a1cfff17a42cc88911e8cda90f7df",
"assets/packages/pay_android/assets/fr/donate_with.svg": "07900374e3368d6f20546626f70aa82b",
"assets/packages/pay_android/assets/fr/order_with.svg": "22309a4f9eeb40274d56918e1ed7c23a",
"assets/packages/pay_android/assets/fr/pay_with.svg": "28450f3a76f521389ab858da00ab5b77",
"assets/packages/pay_android/assets/fr/subscribe_with.svg": "4f27ea754516e1604b956e71a2cfb95a",
"assets/packages/pay_android/assets/gpay_logo.svg": "3564204149c26f43d43cb236d4ff97a3",
"assets/packages/pay_android/assets/hr/add_to.svg": "da2abdcd0e4e56e9430bfeb6734443e1",
"assets/packages/pay_android/assets/hr/book_with.svg": "1654f1c7b29f575fd8746c593b11f2b0",
"assets/packages/pay_android/assets/hr/buy_with.svg": "159492769a625370e20245cae84d2b0f",
"assets/packages/pay_android/assets/hr/checkout_with.svg": "e3e05f46435cccc7675b7639a02e051a",
"assets/packages/pay_android/assets/hr/donate_with.svg": "1f3ee9c7f4310da39c6caa910dbfc86e",
"assets/packages/pay_android/assets/hr/order_with.svg": "e8da0122c88bcf2e8976f73e8ad51e53",
"assets/packages/pay_android/assets/hr/pay_with.svg": "2d73f342e8c91370c1128ebc51aa0a16",
"assets/packages/pay_android/assets/hr/subscribe_with.svg": "ff158be92c02c121f7467c6edcf3cf81",
"assets/packages/pay_android/assets/id/add_to.svg": "2869480691c5825d68111e6247e4e403",
"assets/packages/pay_android/assets/id/book_with.svg": "ad720d063a1c28c182d405aba95e018d",
"assets/packages/pay_android/assets/id/buy_with.svg": "a6ca8e78f15523f0b879b5fd8acc2281",
"assets/packages/pay_android/assets/id/checkout_with.svg": "7f8ae4686a866886f91048d0c15607c5",
"assets/packages/pay_android/assets/id/donate_with.svg": "65ebe635f7ee6e5926153e199fc52e1b",
"assets/packages/pay_android/assets/id/order_with.svg": "1b751923e4feb8694879ebe44bd1c2a1",
"assets/packages/pay_android/assets/id/pay_with.svg": "b13a28beee4ab06f6b837ff53d485c3e",
"assets/packages/pay_android/assets/id/subscribe_with.svg": "5dc280aac3d0c98f537055f47eed979a",
"assets/packages/pay_android/assets/it/add_to.svg": "5492101c855444bad5c566051da99a51",
"assets/packages/pay_android/assets/it/book_with.svg": "1a26e5ccf20ca263391873a3a4e3364e",
"assets/packages/pay_android/assets/it/buy_with.svg": "0a1c6a223718b57693f5180f49e4069c",
"assets/packages/pay_android/assets/it/checkout_with.svg": "2440a69133831cd23bb33d529a4e67b1",
"assets/packages/pay_android/assets/it/donate_with.svg": "23d3b8d82dbf9756394ca2308e1c8119",
"assets/packages/pay_android/assets/it/order_with.svg": "3b21e5135549ffa89b0891d331339e0a",
"assets/packages/pay_android/assets/it/pay_with.svg": "367408b9d6b9f43168e84ee5e21753e7",
"assets/packages/pay_android/assets/it/subscribe_with.svg": "03fa498042e0d13949373b545b6c1271",
"assets/packages/pay_android/assets/ja/add_to.svg": "42ad478d343da3aca3226ddbcc1bbe96",
"assets/packages/pay_android/assets/ja/book_with.svg": "643a14c418f3e061d86038d28b473d07",
"assets/packages/pay_android/assets/ja/buy_with.svg": "b460024b19fd6c17cee1677dabe142a5",
"assets/packages/pay_android/assets/ja/checkout_with.svg": "ffa79096847796389212aec30b44d7ba",
"assets/packages/pay_android/assets/ja/donate_with.svg": "3050d160d31becee6cdd6e3397d722d7",
"assets/packages/pay_android/assets/ja/order_with.svg": "f62cb0a507f6fcdd44ff3862230eaf61",
"assets/packages/pay_android/assets/ja/pay_with.svg": "271c5a7adce4a6da1b10aab271180e33",
"assets/packages/pay_android/assets/ja/subscribe_with.svg": "faa9e34a03afc68145627a45757c0c51",
"assets/packages/pay_android/assets/ko/add_to.svg": "02994d33528d1b69af6eb866ee39ec76",
"assets/packages/pay_android/assets/ko/book_with.svg": "9cf579fa3892daf5bd1e651e7e8e07b1",
"assets/packages/pay_android/assets/ko/buy_with.svg": "6289d89e0d8a11b933f421ad48dd574f",
"assets/packages/pay_android/assets/ko/checkout_with.svg": "73219d3fa26f7e1d4fb9c62f2a86a47d",
"assets/packages/pay_android/assets/ko/donate_with.svg": "0ecf99c7cabf3d971092e2d26518d280",
"assets/packages/pay_android/assets/ko/order_with.svg": "6c0ceb1ae67bb1a486a1d9bee8b9844d",
"assets/packages/pay_android/assets/ko/pay_with.svg": "cf54a6042572e4b5232eea80ce93aa06",
"assets/packages/pay_android/assets/ko/subscribe_with.svg": "c92fbf545a01ff6182d6733097fd056b",
"assets/packages/pay_android/assets/ms/add_to.svg": "967674567e0a256ba609e85ac9efa415",
"assets/packages/pay_android/assets/ms/book_with.svg": "5976935ace72bcc9b898c47fbb3ab8b0",
"assets/packages/pay_android/assets/ms/buy_with.svg": "6ad18fe663279303a53da0bcb28c88ff",
"assets/packages/pay_android/assets/ms/checkout_with.svg": "65cf7be75645cc6ac90c9ee4cb40e4f3",
"assets/packages/pay_android/assets/ms/donate_with.svg": "79cea13f10775a1f47107fd0d1d77c0d",
"assets/packages/pay_android/assets/ms/order_with.svg": "732033acf5ea72bd8b8b939e7d92da7e",
"assets/packages/pay_android/assets/ms/pay_with.svg": "d87232bd00f4754d945776a1c11a9a83",
"assets/packages/pay_android/assets/ms/subscribe_with.svg": "fff5fd19393074960efdef781bc2f3ce",
"assets/packages/pay_android/assets/nl/add_to.svg": "12b15901165211e6faea8c59bedf46bc",
"assets/packages/pay_android/assets/nl/book_with.svg": "a7fdc9acb2e5d40386e359cd74bb476e",
"assets/packages/pay_android/assets/nl/buy_with.svg": "c9b427cbce42daacf7f014cfe6c9f4cd",
"assets/packages/pay_android/assets/nl/checkout_with.svg": "d8c455f43207bf5264ceb331520516c3",
"assets/packages/pay_android/assets/nl/donate_with.svg": "72b927ee6f58784cfc2b6cea1517b234",
"assets/packages/pay_android/assets/nl/order_with.svg": "bb0a74363748fb38c212c7d9bb00c393",
"assets/packages/pay_android/assets/nl/pay_with.svg": "bbd9854482ed17fb476fe6181cebdee0",
"assets/packages/pay_android/assets/nl/subscribe_with.svg": "81960c4729df02d9b4ef626515ae7ecc",
"assets/packages/pay_android/assets/no/add_to.svg": "63eea58c795662bd6a6613bcb7e7a0b2",
"assets/packages/pay_android/assets/no/book_with.svg": "6237f51d85d10760e6ca7a4ea2d90400",
"assets/packages/pay_android/assets/no/buy_with.svg": "6d85d37387e56f1dd7c7e37f9ae29a88",
"assets/packages/pay_android/assets/no/checkout_with.svg": "dccdc27802c8e214a65b7b1e02838ede",
"assets/packages/pay_android/assets/no/donate_with.svg": "6a7a6ab52b16d8091f709b47e1f667d1",
"assets/packages/pay_android/assets/no/order_with.svg": "e687d46a19efbd7c6f9e02495663d908",
"assets/packages/pay_android/assets/no/pay_with.svg": "48f54a7c71e8a9b1d2bcf853c0254b8c",
"assets/packages/pay_android/assets/no/subscribe_with.svg": "81caffa3709ecb2e73cb74439079331d",
"assets/packages/pay_android/assets/pl/add_to.svg": "a9bdfbc147a9036ca9c2e0f2a5e44054",
"assets/packages/pay_android/assets/pl/book_with.svg": "23b2f875070896871c9962bee6cec0da",
"assets/packages/pay_android/assets/pl/buy_with.svg": "98f1f1c19592a0f03bef3323a96f6536",
"assets/packages/pay_android/assets/pl/checkout_with.svg": "5375607852a44e0bcf9dd03c1566cf6f",
"assets/packages/pay_android/assets/pl/donate_with.svg": "c19b6c96de520b8d0ade219079ed074d",
"assets/packages/pay_android/assets/pl/order_with.svg": "22d53804e79ea15b494d000228ffb590",
"assets/packages/pay_android/assets/pl/pay_with.svg": "d900fccfc783241afd48264ba57663d5",
"assets/packages/pay_android/assets/pl/subscribe_with.svg": "4efdfc25f0b0a08f03d361378008d509",
"assets/packages/pay_android/assets/pt/add_to.svg": "c8065cd21e8bf7c57b08201b5195e03b",
"assets/packages/pay_android/assets/pt/book_with.svg": "ae15c095294c005c0cd3b129ceb3d983",
"assets/packages/pay_android/assets/pt/buy_with.svg": "471f610e7e2126e5f676f411f38ffa72",
"assets/packages/pay_android/assets/pt/checkout_with.svg": "6705f22ed640ae242d97b1eb2ca66576",
"assets/packages/pay_android/assets/pt/donate_with.svg": "6fe25733f5ace8d8692a6ef53ba8af3c",
"assets/packages/pay_android/assets/pt/order_with.svg": "b0487e040573c9bee4dc8a005b0dae33",
"assets/packages/pay_android/assets/pt/pay_with.svg": "a55736ba5eb3056cb6bfbfedd93e3ecc",
"assets/packages/pay_android/assets/pt/subscribe_with.svg": "7623533120b9421ded9bb33b824f5bc8",
"assets/packages/pay_android/assets/ru/add_to.svg": "f60d842274a4c1e031f138a9df9ba6bc",
"assets/packages/pay_android/assets/ru/book_with.svg": "97a21c6530057a45d4eaf801219b7031",
"assets/packages/pay_android/assets/ru/buy_with.svg": "c37576af5a19737790bc312bd2a96bee",
"assets/packages/pay_android/assets/ru/checkout_with.svg": "8b0b720f11b553f67994743dfd0c037e",
"assets/packages/pay_android/assets/ru/donate_with.svg": "2e5a2d0b92282c39d629e4f2cd80976c",
"assets/packages/pay_android/assets/ru/order_with.svg": "fbe5b45a2c3582746032ad38df0cfca1",
"assets/packages/pay_android/assets/ru/pay_with.svg": "2740ef0a026e9121a71e8955c5d916b2",
"assets/packages/pay_android/assets/ru/subscribe_with.svg": "56e37dc3ff3a80ed7e39f5aa91df4c29",
"assets/packages/pay_android/assets/sk/add_to.svg": "00c04b0acc20a448fa6dfee0b966545c",
"assets/packages/pay_android/assets/sk/book_with.svg": "c0b8d28152bbe05663888c246af999a6",
"assets/packages/pay_android/assets/sk/buy_with.svg": "e92b318a6e6ec8213d60d19692e2dd53",
"assets/packages/pay_android/assets/sk/checkout_with.svg": "159ea444626e2b950cc69cf54c850808",
"assets/packages/pay_android/assets/sk/donate_with.svg": "f6df0117e4b724d292556b4e6ebb216b",
"assets/packages/pay_android/assets/sk/order_with.svg": "7c0210ac18b4ffe5702b6467058679bd",
"assets/packages/pay_android/assets/sk/pay_with.svg": "0b01f6484ed710b41b56155f2078081e",
"assets/packages/pay_android/assets/sk/subscribe_with.svg": "7cf1b3d1ef625f83e7fd0079e4bdc303",
"assets/packages/pay_android/assets/sl/add_to.svg": "1a1b772b764e381b4205c78d59b61e7a",
"assets/packages/pay_android/assets/sl/book_with.svg": "c3b7b177b968ce9e2777295d31765ed0",
"assets/packages/pay_android/assets/sl/buy_with.svg": "0d329d0d3a218f0622d2a1ca9c1a9684",
"assets/packages/pay_android/assets/sl/checkout_with.svg": "72e752b5950544e1090850686c5b6de9",
"assets/packages/pay_android/assets/sl/donate_with.svg": "8fe271e938ad174fde2110ac55ed3d9f",
"assets/packages/pay_android/assets/sl/order_with.svg": "1654a93363261f2f5d8b91baa2072be9",
"assets/packages/pay_android/assets/sl/pay_with.svg": "39aa5ba8c0602e5ca1f4053b0f3f973b",
"assets/packages/pay_android/assets/sl/subscribe_with.svg": "cec97c1774af765e84a14b70ad360214",
"assets/packages/pay_android/assets/sr/add_to.svg": "339ac278a3ca72a11035bf600c081655",
"assets/packages/pay_android/assets/sr/book_with.svg": "1ebf2b71a0938eec49672ce0d3a7e1a9",
"assets/packages/pay_android/assets/sr/buy_with.svg": "f5d8a9607826c3d061ee3a49aa8cc7a8",
"assets/packages/pay_android/assets/sr/checkout_with.svg": "3725fb1399a3b4c8db5a2c372778b289",
"assets/packages/pay_android/assets/sr/donate_with.svg": "12d74be686c4eb1d10fbbd9ada5ab5a3",
"assets/packages/pay_android/assets/sr/order_with.svg": "ff8af34524e7704744bf1b5abbda4b9e",
"assets/packages/pay_android/assets/sr/pay_with.svg": "5748ab84509f6ce61b57a5f922de078e",
"assets/packages/pay_android/assets/sr/subscribe_with.svg": "62445480dc5ddd0ef26d2a48ffe1d2a2",
"assets/packages/pay_android/assets/sv/add_to.svg": "0fa576dfcac72a70fead63c960b066cf",
"assets/packages/pay_android/assets/sv/book_with.svg": "1ff19d0dcbacb1ef977f18eded0931f6",
"assets/packages/pay_android/assets/sv/buy_with.svg": "36e951a4737af9b7541342620a6e0f03",
"assets/packages/pay_android/assets/sv/checkout_with.svg": "8c0811d30b32d77e85752612e16347a9",
"assets/packages/pay_android/assets/sv/donate_with.svg": "e0888ff4e14a434daf98167d9f11c849",
"assets/packages/pay_android/assets/sv/order_with.svg": "13e3a0b6444a9765762d1cdea97158bf",
"assets/packages/pay_android/assets/sv/pay_with.svg": "611dc13ea36a14458c0a103ebf344c5a",
"assets/packages/pay_android/assets/sv/subscribe_with.svg": "db6ba6d478437b7b1379c854338fc2fd",
"assets/packages/pay_android/assets/th/add_to.svg": "b741a2d0656aaaefc1cf4ea60bcdecf6",
"assets/packages/pay_android/assets/th/book_with.svg": "d1ea78f759c0730765b1566234e03ed5",
"assets/packages/pay_android/assets/th/buy_with.svg": "3837161aed04fdd24818337f4f568464",
"assets/packages/pay_android/assets/th/checkout_with.svg": "c0e9836a6073f2b8e8ef0ae790519102",
"assets/packages/pay_android/assets/th/donate_with.svg": "f690e4cfa2407e46c1100794a0379179",
"assets/packages/pay_android/assets/th/order_with.svg": "dcc18c36a5c21b3ce4e0dd8dc0b6490c",
"assets/packages/pay_android/assets/th/pay_with.svg": "9bebf557fd04d41d19d5bd3b11bf329e",
"assets/packages/pay_android/assets/th/subscribe_with.svg": "d995c84c7369f9617917f8b0dfde18cd",
"assets/packages/pay_android/assets/tr/add_to.svg": "c0626c594a4957f17213f34dcc7f9334",
"assets/packages/pay_android/assets/tr/book_with.svg": "c5e289ea0a8f031c63fb472254b09138",
"assets/packages/pay_android/assets/tr/buy_with.svg": "3b11a3fbfd947bad5801c806e33974ee",
"assets/packages/pay_android/assets/tr/checkout_with.svg": "a0795172799ae5ef54447e03e2ee0bbd",
"assets/packages/pay_android/assets/tr/donate_with.svg": "c64a19f7861bed2875ea0d0d9947f69d",
"assets/packages/pay_android/assets/tr/order_with.svg": "aa94f2a090070d84fee97aa1f56d63ce",
"assets/packages/pay_android/assets/tr/pay_with.svg": "740416884081b4de669c677f8176bc60",
"assets/packages/pay_android/assets/tr/subscribe_with.svg": "9806d0f37dd28211b575219569ec0267",
"assets/packages/pay_android/assets/uk/add_to.svg": "4fa73cb089fa5227926498f32b701665",
"assets/packages/pay_android/assets/uk/book_with.svg": "f42d7fe05b8641eb400b2d189e1268f7",
"assets/packages/pay_android/assets/uk/buy_with.svg": "ee21017c523db6ed41355a984ac2773d",
"assets/packages/pay_android/assets/uk/checkout_with.svg": "4295c540e4be0e1e88b134ce1c7ed28a",
"assets/packages/pay_android/assets/uk/donate_with.svg": "cf8511ce785f0699f8d270682c99e276",
"assets/packages/pay_android/assets/uk/order_with.svg": "c30bacc2e3f81b8d15e97df98269d6c8",
"assets/packages/pay_android/assets/uk/pay_with.svg": "673c44c6bfee363fd974e3d469dd765d",
"assets/packages/pay_android/assets/uk/subscribe_with.svg": "98ab77df273ccf318c099278e7ca767b",
"assets/packages/pay_android/assets/zh/add_to.svg": "7cd05c87ef08317720372ff96000fcaf",
"assets/packages/pay_android/assets/zh/book_with.svg": "3890280055e8b622a6cb73cb2aa6e111",
"assets/packages/pay_android/assets/zh/buy_with.svg": "4e9f08fd3c90121c12a711f45cdfbcc8",
"assets/packages/pay_android/assets/zh/checkout_with.svg": "12e7529fb599e632fe130a6cc1aafbe3",
"assets/packages/pay_android/assets/zh/donate_with.svg": "3207f3b513ba810952d797e6fd2faf77",
"assets/packages/pay_android/assets/zh/order_with.svg": "1e4fb2c463f50e6d9b07deff3eff47bb",
"assets/packages/pay_android/assets/zh/pay_with.svg": "1c8f6a08eeff10a93f9fe78af091b6fb",
"assets/packages/pay_android/assets/zh/subscribe_with.svg": "dc73191614afeaf76abf2be904821744",
"assets/packages/pay_platform_interface/pubspec.yaml": "5560a47d560610d5fda44a4b8d423776",
"assets/shaders/ink_sparkle.frag": "2ad5fabd6a36a6deff087b8edfd0c1f8",
"canvaskit/canvaskit.js": "2bc454a691c631b07a9307ac4ca47797",
"canvaskit/canvaskit.wasm": "bf50631470eb967688cca13ee181af62",
"canvaskit/profiling/canvaskit.js": "38164e5a72bdad0faa4ce740c9b8e564",
"canvaskit/profiling/canvaskit.wasm": "95a45378b69e77af5ed2bc72b2209b94",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "8ae00b472ec3937a5bee52055d6bc8b4",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "b0fbdc08621507a269e541b00076e241",
"/": "b0fbdc08621507a269e541b00076e241",
"main.dart.js": "80c5c41af1c876aa8709cd6433fb28aa",
"manifest.json": "85a82fb7af69e30421b7fddf1a521157",
"version.json": "cabea2c5b032a8177133197d3abd9559"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
