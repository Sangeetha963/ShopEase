'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "f6aa219980d1e4b4b606fac21b801c98",
"version.json": "eaedbc4ce782a0d70ee0e7bd88ccbee2",
"index.html": "c1dd44655189c811a1c2993519755342",
"/": "c1dd44655189c811a1c2993519755342",
"main.dart.js": "f19dfcfc84f5aab43446b00262285745",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "bb4432a65334fac22de04f3f0ac9cbf4",
"assets/AssetManifest.json": "d8d3b5e11db351d6dd62dcaa47cad05e",
"assets/NOTICES": "b60babc8a2800c40bac5ee6a16f9d3b6",
"assets/FontManifest.json": "13f2d5a1592b9371295a772e8dddea78",
"assets/AssetManifest.bin.json": "3a63901a38992350359d7211b61028f2",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/media_kit/assets/web/hls1.4.10.js": "bd60e2701c42b6bf2c339dcf5d495865",
"assets/packages/stream_chat_flutter/lib/assets/images/placeholder.png": "30d340bd4f082a7ef08376e916d960d8",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_eye.svg": "5e196a456b17186ff27b9179a2ba496f",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_check_all.svg": "30c90e1bd4aad756b61c55646948b2f1",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_presentation_pps.svg": "afbe818fa1e086cb87bd6495e0cddd9f",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_compression_rar.svg": "92bb515b58ab223e168f7eec5d888ac8",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_spreadsheet_xlsx.svg": "d66e0a94fcda81662851bb7cd8f1b337",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_presentation_standard.svg": "ceacca50c93c7de9e4a2d80900aa0b92",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_presentation_special.svg": "f62a6a68281e05bca52fd5c5a92a1087",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_spreadsheet_special.svg": "0fafece588cf540f06013f55d7bca0c1",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_audio_special.svg": "d8de22f317357d7a35df62ff7cfd3b51",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_code_tar.svg": "db1f821052a793ace15f3e58d73d1883",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_presentation_odp.svg": "9e649fe4d544a2422b3794a6ac38ecb4",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_audio_mp3.svg": "6c8afdc4824eacaec07c0e6928c67331",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_compression_deb.svg": "31ae53dac6e3c6df1b5eed70261d01ab",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_spreadsheet_xlsm.svg": "0f3c9aed2ea725af010e179c99456f52",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_imgur.svg": "91066e19e8f51ddf78e960eb0c02b6c5",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_text_odt.svg": "e4376a93b8c5b272f5caa73d077f36a0",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_presentation_ppt.svg": "f91b088c80652dff1d8f7cd3a43065ba",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_code_standard.svg": "d4b6b0142a2ab49950810334ce91a66d",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_audio_flac.svg": "68a6ab5bc81e52a45d529eb94b1b478b",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_text_special.svg": "3f6cd40d71b32cbd981ce9356d492b0c",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_spreadsheet_ods.svg": "6da8686e90f41da4211af0edccaaaa85",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_code_xml.svg": "88cb7255338d7e105f10b4e672b634fe",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_compression_pkg.svg": "b9223d57bd53e9d78a1a3ca0fdabbca2",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_spreadsheet_xls.svg": "251f330e13ef834f1e82de10741b0633",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_text_wdp.svg": "a37150d13a7f25d42e2c0abd2a04800a",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_compression_zip.svg": "a47aad2f585586fcc4e0a0de2938769c",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_spreadsheet_standard.svg": "3861ddc6207f9fa975632b114858547f",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_audio_aac.svg": "7732be41b0b46dbbb631427b90fa2c64",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_other_pdf.svg": "898bf96ad5091569047807dc7baa02f1",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_code_sav.svg": "8a8ccc61b4e2182df878f19c51695697",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_compression_rpm.svg": "082045bd2e82113643bfce207e234014",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_giphy.svg": "524ab87af68824e51971e5f08ab63e7f",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_other_special.svg": "e1f0d72e77cc7476c2312a9399d69adb",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_audio_m4a.svg": "0f2167b79c854aca6a68545691155dff",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_audio_m4b.svg": "958b7a2d6956e6c5669273f21e8a2805",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_compression_arj.svg": "39b06497abe63b9b610ec2c4398eb11d",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_text_standard.svg": "666f9ef2cd205f55267acdadc2971515",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_code_md.svg": "a2ec27e83384f2243ff24d43d4b5b032",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_text_txt.svg": "54e98a19d14a19305768d7ce81a2c253",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_text_rtf.svg": "586e2527d22df008251641b991d3082c",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_compression_7z.svg": "3bce72a1b1571248064a046442bdf2a7",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_audio_standard.svg": "db6cdbea48d173bd8a99f135d7c35cb7",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_other_standard.svg": "f68550cc7944a226237fbec7f2d8b878",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_code_csv.svg": "7f0a3dc85a53fa3f7c8ab2cc30a1463d",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_code_html.svg": "8749f8fcb62824f2030d014bdea40edc",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_code_dat.svg": "747dc6951db9ef398acbfd56b53fd02d",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_presentation_pptx.svg": "b6e0488aec8aa9fc12f8659582ba68cd",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_other_wkq.svg": "54ac89631f76d516209a7b1321b672f7",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_compression_z.svg": "58faefd3a7d33c04a0c21b9b2234421b",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_audio_aiff.svg": "023e85e0d639f3c734457c182ec1de91",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_code_special.svg": "bd2a0269446cda8fa599017cc2e93cff",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_compression_standard.svg": "dd24bb31aaa2b1d5521cf040ce4fe506",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_text_doc.svg": "179d83d3aeadd45be9900448bde8e32e",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_audio_ogg.svg": "aaee7bd62926cd77b3fa91d9931d7833",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_compression_special.svg": "32570557e5e99de85f0893c59297701b",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_presentation_key.svg": "ea19f9b448ed6ec4947d1153868e1f01",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_compression_tar.gz.svg": "f51b3c4a9797362bdea314d7ccd390e6",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_audio_wav.svg": "4c8b84de66030e8938b3d21bd3859ddc",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_text_tex.svg": "4a9a1666920111cc43f21315c2c9d8be",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_code_db.svg": "c6d2c97c1115a31559bf8f77525c27e4",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_text_docx.svg": "c64f81e396e3fd9cd3e07b516f2a2660",
"assets/packages/stream_chat_flutter/lib/assets/icons/colored/icon_filetype_audio_alac.svg": "51bf906cbb82d7ed8a5eded4206f5d8a",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_menu_point.svg": "158fd4ef86df35c6f4cc69b7bc627d95",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_pause.svg": "2bce0e0b2180df578022dbd1185de6d7",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_error.svg": "f16fadef3f135496cac466cb1047959f",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_user_add.svg": "7ef8ea682ad858fc183143537e5bca40",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_pen_write.svg": "8f785ba0458d5d137028fe5724aef254",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_share.svg": "ed14604c307d1e0ed234f01fe1b6c6f2",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_record.svg": "8b459abc54cbe474ba374a8cd43e088c",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_message.svg": "381c441ea243364fa8961800d24e15ed",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_moon.svg": "0126da07e3ba678a723e517b16a00868",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_left.svg": "f07220f1dbc4ed99105877022f809fa0",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_save.svg": "c05aa9408d4d5e40418478407f163ac0",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_cloud_download.svg": "11ce2071c97c18e4945d21d312f5731a",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_settings.svg": "b895f9b41094cdefc8aa7975a75bf44c",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_mentions.svg": "e59e324a4dd4fe9dc2690779c314afec",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_thumbs_down_reaction.svg": "53e62bfeb14f7586b42689b63a07c4aa",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_circle_up.svg": "1d2ba6cb3063f92e3879d62945837342",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_copy.svg": "e20fc29361b6f7cc4dc84e42be83a7da",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_mic.svg": "0f4127ebec63f063b2b6abe009968bb8",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_download.svg": "5220f137a75958ad1226015a75d721de",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_send.svg": "7e54e5abbc49632c1f52dfd916d2f16d",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_message_unread.svg": "3b47762490f2193bb6b471523ef116a0",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_search.svg": "384d2e670111fd85622cf3d7d28fea67",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_play.svg": "4f86593696b8bcb2204b651350d9f52f",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_love_reaction.svg": "d2809cb6ba8865bd6dcd7966edb7dce0",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_user_settings.svg": "b4f22896e4407e41cbd39bce3d8f4ff7",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_share_arrow.svg": "99e94ba816ccb29528ffbd379f92006a",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_polls.svg": "301b90a53a038f50b6c4f4e1b74e8433",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_smile.svg": "e815c6968af3ae18cdda3f77079ceffc",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_right.svg": "910e4951b29a22f10cedf02dd336db87",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_video_call.svg": "37a0923d8fff7425c75c5c8113d5b441",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_close.svg": "151dc1751f02d199861dd539059272af",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_volume_up.svg": "407092e0926016d3820e7f1270cb6cf7",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_mute.svg": "f6e48f2fcbeb684eaf79cdc140707713",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_lightning.svg": "ad8eda2b9178cf66a3ca97b91c52ce15",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_thread_reply.svg": "d3de32551ffb3a553712675f9e599e55",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_send_message.svg": "3f17f602d33cf04ec47c13a0c506b5b1",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_edit.svg": "8f785ba0458d5d137028fe5724aef254",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_award.svg": "ab9128b855bb4e34107a283da64beb09",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_close_small.svg": "4bbe300e6de2e0e9156df51190e16e57",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_link.svg": "409cf82d533a29832dbe4000565fa8fd",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_user_delete.svg": "56ce9bde769475b342158b9b204cab34",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_attach.svg": "2ca2a6ab62cca2f15e7abec0c19f3b70",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_notification.svg": "9ee0872399694b8fd8f07c2ec73bb748",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_lock.svg": "5997c3dee21ddd90db5e0e3b5ad42b54",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_arrow_right.svg": "9ae306db5f8ae0537ddba1e66c895ed2",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_pin.svg": "11624b323b5d8a03108cf5291d8d1353",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_time.svg": "caf748b81a236c92542fc267b25a159c",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_empty_circle_right.svg": "f80f65a6f326e658e75e89dec12f6ceb",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_user_remove.svg": "b6832c16828c859f6565a35b46f21c8a",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_delete.svg": "a7650f0fb2bb4d4d4e7d658c8fed6704",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_check.svg": "a3fd8b5b133ab0fe4918778d82d165ae",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_stop.svg": "224128048c91c3a3505e13db1211dffe",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_thumbs_up_reaction.svg": "4c6d1c91d73f2a9b520675e133992e59",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_flag.svg": "c4dfa20d6b1caadf3436c75f9eea145a",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_lol_reaction.svg": "baec6ec52d50bde5485b0b6f0cff9ebd",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_up.svg": "aeae804efc0b4311366fbc42b0cd53e5",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_retry.svg": "204ed05d0f2a0745ef5518c45650a30d",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_group.svg": "477d6d18f41a238efb8b5129f7d56469",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_contacts.svg": "477d6d18f41a238efb8b5129f7d56469",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_pictures.svg": "49a0332d34fbefa3c2d629342af85459",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_check_send.svg": "b36bec7a1c0a99684d73216653000e72",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_camera.svg": "8599462cefa5ff8847b7e7c2f0535ff7",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_wut_reaction.svg": "d812a34af414a1239007031d76fdd509",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_grid.svg": "c08a5c4ca4932a70c9c8d29c69d0fc30",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_user.svg": "0b9cfbbf17dec7d3a23e2a5c80ada957",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_files.svg": "40b89e07981549b1c5224dacd8187601",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_reload.svg": "c07e9431f81627270e9f9362b1dbf999",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_down.svg": "6b5cb0fad8cf2af6b40d663f068269dc",
"assets/packages/stream_chat_flutter/lib/assets/icons/icon_reply.svg": "ac55606509699868d12da47121fa6e00",
"assets/packages/stream_chat_flutter/lib/assets/animations/typing_dots.json": "3da1c94690095d3a96014b4c695227b7",
"assets/packages/record_web/assets/js/record.fixwebmduration.js": "1f0108ea80c8951ba702ced40cf8cdce",
"assets/packages/record_web/assets/js/record.worklet.js": "6d247986689d283b7e45ccdf7214c2ff",
"assets/packages/wakelock_plus/assets/no_sleep.js": "7748a45cd593f33280669b29c2c8919a",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "bb9c51a8d9aea72c2a176c6a55c45a42",
"assets/fonts/MaterialIcons-Regular.otf": "ae213b4a09e249e0bcc4c32750066c58",
"assets/assets/images/products/headphones.png": "683649487fae8109d848934deeeb51e4",
"assets/assets/images/products/watch.png": "de79cf7d6f9237be3e739958319c9920",
"assets/assets/images/products/fashion.png": "ebc09567a3ead1c0796d54ee05d405b4",
"assets/assets/images/products/Jacket.png": "2b353503afd0f135dc11d04d46a9b4ef",
"assets/assets/images/products/solid_wood_dinning.png": "cddbc917695713b8f9b876eb1b4ee816",
"assets/assets/images/products/backpack.png": "afc7c72056036b8abe79a40edbce39a1",
"assets/assets/images/products/Handbag.png": "1d076891fc68812812f3692809ae1cad",
"assets/assets/images/products/smartphone.png": "d2dba518022318c8bd4866c1563c0249",
"assets/assets/images/products/home.png": "61ef1f9395ad17a036e29d17da2ef93e",
"assets/assets/images/products/Home-Decor.png": "72c662ae6d549bc6e969f96a6ce9eb49",
"assets/assets/images/products/Home-Decor-Clock.png": "804355cdc2f61be6c6aa13d41bd60d0f",
"assets/assets/images/products/electronics.png": "cd145d76d4c21fe341c031cbfd8548e6",
"assets/assets/images/products/shoes.png": "6224a9de0b33a8adb501ee910fc7caab",
"assets/assets/images/products/japanese-book.png": "363ceea1a91f35bcfabe6a8ca60d1001",
"assets/assets/images/products/laptop.png": "73fccfe2f9be143d20da7f7865d289e2",
"assets/assets/images/products/sunglasses.png": "4b6b98a714b7f791ecb89cceea261ac0",
"assets/assets/images/products/Wireless-Earbuds.png": "c4a9e5f25981f764976fa9ac056647fe",
"assets/assets/images/products/camera.png": "0a81f8d261d8d9a57c243c14172db7f5",
"assets/assets/images/products/Furniture.png": "f19457b957168b3e3c0138daf43ebc80",
"assets/assets/images/logo.png": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/fonts/Poppins-Regular.ttf": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/fonts/Poppins-Bold.ttf": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/animations/loading.json": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/animations/success.json": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/animations/cart_empty.json": "d41d8cd98f00b204e9800998ecf8427e",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
