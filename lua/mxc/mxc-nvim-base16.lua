local base16 = {
  base00="#161213"; base01="#242a2e"; base02="#3a2c2d"; base03="#504257";
  base04="#846f90"; base05="#a58d8e"; base06="#aab4bb"; base07="#d1c7c7";
  base08="#e54353"; base09="#fa9e4d"; base0A="#fa9e4d"; base0B="#a264c0";
  base0C="#6bca89"; base0D="#856bd3"; base0E="#d56167"; base0F="#4999cf";
}
return base16

-- local theme = base16.theme_from_array = mxc-base16
-- base16(theme, true)

-- base00 - Default Background
-- base01 - Lighter Background (Used for status bars, line number and folding marks)
-- base02 - Selection Background
-- base03 - Comments, Invisibles, Line Highlighting
-- base04 - Dark Foreground (Used for status bars)
-- base05 - Default Foreground, Caret, Delimiters, Operators
-- base06 - Light Foreground (Not often used)
-- base07 - Light Background (Not often used)
--
-- base08 - Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
-- base09 - Integers, Boolean, Constants, XML Attributes, Markup Link Url
-- base0A - Classes, Markup Bold, Search Text Background
-- base0B - Strings, Inherited Class, Markup Code, Diff Inserted
--
-- base0C - Support, Regular Expressions, Escape Characters, Markup Quotes
-- base0D - Functions, Methods, Attribute IDs, Headings
-- base0E - Keywords, Storage, Selector, Markup Italic, Diff Changed
-- base0F - Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>
-- local themes = {}
-- 
-- themes["atelier-cave"] = {
-- 	base00 = "#19171c"; base01 = "#26232a"; base02 = "#585260"; base03 = "#655f6d";
-- 	base04 = "#7e7887"; base05 = "#8b8792"; base06 = "#e2dfe7"; base07 = "#efecf4";
-- 	base08 = "#be4678"; base09 = "#aa573c"; base0A = "#a06e3b"; base0B = "#2a9292";
-- 	base0C = "#398bc6"; base0D = "#576ddb"; base0E = "#955ae7"; base0F = "#bf40bf";
-- }
-- themes["atelier-estuary"] = {
-- 	base00 = "#22221b"; base01 = "#302f27"; base02 = "#5f5e4e"; base03 = "#6c6b5a";
-- 	base04 = "#878573"; base05 = "#929181"; base06 = "#e7e6df"; base07 = "#f4f3ec";
-- 	base08 = "#ba6236"; base09 = "#ae7313"; base0A = "#a5980d"; base0B = "#7d9726";
-- 	base0C = "#5b9d48"; base0D = "#36a166"; base0E = "#5f9182"; base0F = "#9d6c7c";
-- }
-- themes["atelier-forest"] = {
-- 	base00 = "#1b1918"; base01 = "#2c2421"; base02 = "#68615e"; base03 = "#766e6b";
-- 	base04 = "#9c9491"; base05 = "#a8a19f"; base06 = "#e6e2e0"; base07 = "#f1efee";
-- 	base08 = "#f22c40"; base09 = "#df5320"; base0A = "#c38418"; base0B = "#7b9726";
-- 	base0C = "#3d97b8"; base0D = "#407ee7"; base0E = "#6666ea"; base0F = "#c33ff3";
-- }
-- themes["atelier-heath"] = {
-- 	base00 = "#1b181b"; base01 = "#292329"; base02 = "#695d69"; base03 = "#776977";
-- 	base04 = "#9e8f9e"; base05 = "#ab9bab"; base06 = "#d8cad8"; base07 = "#f7f3f7";
-- 	base08 = "#ca402b"; base09 = "#a65926"; base0A = "#bb8a35"; base0B = "#918b3b";
-- 	base0C = "#159393"; base0D = "#516aec"; base0E = "#7b59c0"; base0F = "#cc33cc";
-- }
-- themes["atelier-lakeside"] = {
-- 	base00 = "#161b1d"; base01 = "#1f292e"; base02 = "#516d7b"; base03 = "#5a7b8c";
-- 	base04 = "#7195a8"; base05 = "#7ea2b4"; base06 = "#c1e4f6"; base07 = "#ebf8ff";
-- 	base08 = "#d22d72"; base09 = "#935c25"; base0A = "#8a8a0f"; base0B = "#568c3b";
-- 	base0C = "#2d8f6f"; base0D = "#257fad"; base0E = "#6b6bb8"; base0F = "#b72dd2";
-- }
-- themes["atelier-plateau"] = {
-- 	base00 = "#1b1818"; base01 = "#292424"; base02 = "#585050"; base03 = "#655d5d";
-- 	base04 = "#7e7777"; base05 = "#8a8585"; base06 = "#e7dfdf"; base07 = "#f4ecec";
-- 	base08 = "#ca4949"; base09 = "#b45a3c"; base0A = "#a06e3b"; base0B = "#4b8b8b";
-- 	base0C = "#5485b6"; base0D = "#7272ca"; base0E = "#8464c4"; base0F = "#bd5187";
-- }
-- themes["atelier-savanna"] = {
-- 	base00 = "#171c19"; base01 = "#232a25"; base02 = "#526057"; base03 = "#5f6d64";
-- 	base04 = "#78877d"; base05 = "#87928a"; base06 = "#dfe7e2"; base07 = "#ecf4ee";
-- 	base08 = "#b16139"; base09 = "#9f713c"; base0A = "#a07e3b"; base0B = "#489963";
-- 	base0C = "#1c9aa0"; base0D = "#478c90"; base0E = "#55859b"; base0F = "#867469";
-- }
-- themes["atelier-seaside"] = {
-- 	base00 = "#131513"; base01 = "#242924"; base02 = "#5e6e5e"; base03 = "#687d68";
-- 	base04 = "#809980"; base05 = "#8ca68c"; base06 = "#cfe8cf"; base07 = "#f4fbf4";
-- 	base08 = "#e6193c"; base09 = "#87711d"; base0A = "#98981b"; base0B = "#29a329";
-- 	base0C = "#1999b3"; base0D = "#3d62f5"; base0E = "#ad2bee"; base0F = "#e619c3";
-- }
-- themes["atelier-sulphurpool"] = {
-- 	base00 = "#202746"; base01 = "#293256"; base02 = "#5e6687"; base03 = "#6b7394";
-- 	base04 = "#898ea4"; base05 = "#979db4"; base06 = "#dfe2f1"; base07 = "#f5f7ff";
-- 	base08 = "#c94922"; base09 = "#c76b29"; base0A = "#c08b30"; base0B = "#ac9739";
-- 	base0C = "#22a2c9"; base0D = "#3d8fd1"; base0E = "#6679cc"; base0F = "#9c637a";
-- }
-- themes["atlas"] = {
-- 	base00 = "#002635"; base01 = "#00384d"; base02 = "#517F8D"; base03 = "#6C8B91";
-- 	base04 = "#869696"; base05 = "#a1a19a"; base06 = "#e6e6dc"; base07 = "#fafaf8";
-- 	base08 = "#ff5a67"; base09 = "#f08e48"; base0A = "#ffcc1b"; base0B = "#7fc06e";
-- 	base0C = "#14747e"; base0D = "#5dd7b9"; base0E = "#9a70a4"; base0F = "#c43060";
-- }
-- themes["black-metal-burzum"] = {
-- 	base00 = "#000000"; base01 = "#121212"; base02 = "#222222"; base03 = "#333333";
-- 	base04 = "#999999"; base05 = "#c1c1c1"; base06 = "#999999"; base07 = "#c1c1c1";
-- 	base08 = "#5f8787"; base09 = "#aaaaaa"; base0A = "#99bbaa"; base0B = "#ddeecc";
-- 	base0C = "#aaaaaa"; base0D = "#888888"; base0E = "#999999"; base0F = "#444444";
-- }
-- themes["black-metal-dark-funeral"] = {
-- 	base00 = "#000000"; base01 = "#121212"; base02 = "#222222"; base03 = "#333333";
-- 	base04 = "#999999"; base05 = "#c1c1c1"; base06 = "#999999"; base07 = "#c1c1c1";
-- 	base08 = "#5f8787"; base09 = "#aaaaaa"; base0A = "#5f81a5"; base0B = "#d0dfee";
-- 	base0C = "#aaaaaa"; base0D = "#888888"; base0E = "#999999"; base0F = "#444444";
-- }
-- themes["bright"] = {
-- 	base00 = "#000000"; base01 = "#303030"; base02 = "#505050"; base03 = "#b0b0b0";
-- 	base04 = "#d0d0d0"; base05 = "#e0e0e0"; base06 = "#f5f5f5"; base07 = "#ffffff";
-- 	base08 = "#fb0120"; base09 = "#fc6d24"; base0A = "#fda331"; base0B = "#a1c659";
-- 	base0C = "#76c7b7"; base0D = "#6fb3d2"; base0E = "#d381c3"; base0F = "#be643c";
-- }
-- themes["brogrammer"] = {
-- 	base00 = "#1f1f1f"; base01 = "#f81118"; base02 = "#2dc55e"; base03 = "#ecba0f";
-- 	base04 = "#2a84d2"; base05 = "#4e5ab7"; base06 = "#1081d6"; base07 = "#d6dbe5";
-- 	base08 = "#d6dbe5"; base09 = "#de352e"; base0A = "#1dd361"; base0B = "#f3bd09";
-- 	base0C = "#1081d6"; base0D = "#5350b9"; base0E = "#0f7ddb"; base0F = "#ffffff";
-- }
-- themes["brushtrees-dark"] = {
-- 	base00 = "#485867"; base01 = "#5A6D7A"; base02 = "#6D828E"; base03 = "#8299A1";
-- 	base04 = "#98AFB5"; base05 = "#B0C5C8"; base06 = "#C9DBDC"; base07 = "#E3EFEF";
-- 	base08 = "#b38686"; base09 = "#d8bba2"; base0A = "#aab386"; base0B = "#87b386";
-- 	base0C = "#86b3b3"; base0D = "#868cb3"; base0E = "#b386b2"; base0F = "#b39f9f";
-- }
-- themes["brushtrees"] = {
-- 	base00 = "#E3EFEF"; base01 = "#C9DBDC"; base02 = "#B0C5C8"; base03 = "#98AFB5";
-- 	base04 = "#8299A1"; base05 = "#6D828E"; base06 = "#5A6D7A"; base07 = "#485867";
-- 	base08 = "#b38686"; base09 = "#d8bba2"; base0A = "#aab386"; base0B = "#87b386";
-- 	base0C = "#86b3b3"; base0D = "#868cb3"; base0E = "#b386b2"; base0F = "#b39f9f";
-- }
-- themes["chalk"] = {
-- 	base00 = "#151515"; base01 = "#202020"; base02 = "#303030"; base03 = "#505050";
-- 	base04 = "#b0b0b0"; base05 = "#d0d0d0"; base06 = "#e0e0e0"; base07 = "#f5f5f5";
-- 	base08 = "#fb9fb1"; base09 = "#eda987"; base0A = "#ddb26f"; base0B = "#acc267";
-- 	base0C = "#12cfc0"; base0D = "#6fc2ef"; base0E = "#e1a3ee"; base0F = "#deaf8f";
-- }
-- themes["circus"] = {
-- 	base00 = "#191919"; base01 = "#202020"; base02 = "#303030"; base03 = "#5f5a60";
-- 	base04 = "#505050"; base05 = "#a7a7a7"; base06 = "#808080"; base07 = "#ffffff";
-- 	base08 = "#dc657d"; base09 = "#4bb1a7"; base0A = "#c3ba63"; base0B = "#84b97c";
-- 	base0C = "#4bb1a7"; base0D = "#639ee4"; base0E = "#b888e2"; base0F = "#b888e2";
-- }
-- themes["classic-dark"] = {
-- 	base00 = "#151515"; base01 = "#202020"; base02 = "#303030"; base03 = "#505050";
-- 	base04 = "#B0B0B0"; base05 = "#D0D0D0"; base06 = "#E0E0E0"; base07 = "#F5F5F5";
-- 	base08 = "#AC4142"; base09 = "#D28445"; base0A = "#F4BF75"; base0B = "#90A959";
-- 	base0C = "#75B5AA"; base0D = "#6A9FB5"; base0E = "#AA759F"; base0F = "#8F5536";
-- }
-- themes["codeschool"] = {
-- 	base00 = "#232c31"; base01 = "#1c3657"; base02 = "#2a343a"; base03 = "#3f4944";
-- 	base04 = "#84898c"; base05 = "#9ea7a6"; base06 = "#a7cfa3"; base07 = "#b5d8f6";
-- 	base08 = "#2a5491"; base09 = "#43820d"; base0A = "#a03b1e"; base0B = "#237986";
-- 	base0C = "#b02f30"; base0D = "#484d79"; base0E = "#c59820"; base0F = "#c98344";
-- }
-- themes["cupcake"] = {
-- 	base00 = "#fbf1f2"; base01 = "#f2f1f4"; base02 = "#d8d5dd"; base03 = "#bfb9c6";
-- 	base04 = "#a59daf"; base05 = "#8b8198"; base06 = "#72677E"; base07 = "#585062";
-- 	base08 = "#D57E85"; base09 = "#EBB790"; base0A = "#DCB16C"; base0B = "#A3B367";
-- 	base0C = "#69A9A7"; base0D = "#7297B9"; base0E = "#BB99B4"; base0F = "#BAA58C";
-- }
-- themes["darktooth"] = {
-- 	base00 = "#1D2021"; base01 = "#32302F"; base02 = "#504945"; base03 = "#665C54";
-- 	base04 = "#928374"; base05 = "#A89984"; base06 = "#D5C4A1"; base07 = "#FDF4C1";
-- 	base08 = "#FB543F"; base09 = "#FE8625"; base0A = "#FAC03B"; base0B = "#95C085";
-- 	base0C = "#8BA59B"; base0D = "#0D6678"; base0E = "#8F4673"; base0F = "#A87322";
-- }
-- themes["default-dark"] = {
-- 	base00 = "#181818"; base01 = "#282828"; base02 = "#383838"; base03 = "#585858";
-- 	base04 = "#b8b8b8"; base05 = "#d8d8d8"; base06 = "#e8e8e8"; base07 = "#f8f8f8";
-- 	base08 = "#ab4642"; base09 = "#dc9656"; base0A = "#f7ca88"; base0B = "#a1b56c";
-- 	base0C = "#86c1b9"; base0D = "#7cafc2"; base0E = "#ba8baf"; base0F = "#a16946";
-- }
-- themes["dracula"] = {
-- 	base00 = "#282936"; base01 = "#3a3c4e"; base02 = "#4d4f68"; base03 = "#626483";
-- 	base04 = "#62d6e8"; base05 = "#e9e9f4"; base06 = "#f1f2f8"; base07 = "#f7f7fb";
-- 	base08 = "#ea51b2"; base09 = "#b45bcf"; base0A = "#00f769"; base0B = "#ebff87";
-- 	base0C = "#a1efe4"; base0D = "#62d6e8"; base0E = "#b45bcf"; base0F = "#00f769";
-- }
-- themes["eighties"] = {
-- 	base00 = "#2d2d2d"; base01 = "#393939"; base02 = "#515151"; base03 = "#747369";
-- 	base04 = "#a09f93"; base05 = "#d3d0c8"; base06 = "#e8e6df"; base07 = "#f2f0ec";
-- 	base08 = "#f2777a"; base09 = "#f99157"; base0A = "#ffcc66"; base0B = "#99cc99";
-- 	base0C = "#66cccc"; base0D = "#6699cc"; base0E = "#cc99cc"; base0F = "#d27b53";
-- }
-- themes["flat"] = {
-- 	base00 = "#2C3E50"; base01 = "#34495E"; base02 = "#7F8C8D"; base03 = "#95A5A6";
-- 	base04 = "#BDC3C7"; base05 = "#e0e0e0"; base06 = "#f5f5f5"; base07 = "#ECF0F1";
-- 	base08 = "#E74C3C"; base09 = "#E67E22"; base0A = "#F1C40F"; base0B = "#2ECC71";
-- 	base0C = "#1ABC9C"; base0D = "#3498DB"; base0E = "#9B59B6"; base0F = "#be643c";
-- }
-- themes["google-dark"] = {
-- 	base00 = "#1d1f21"; base01 = "#282a2e"; base02 = "#373b41"; base03 = "#969896";
-- 	base04 = "#b4b7b4"; base05 = "#c5c8c6"; base06 = "#e0e0e0"; base07 = "#ffffff";
-- 	base08 = "#CC342B"; base09 = "#F96A38"; base0A = "#FBA922"; base0B = "#198844";
-- 	base0C = "#3971ED"; base0D = "#3971ED"; base0E = "#A36AC7"; base0F = "#3971ED";
-- }
-- themes["gruvbox-dark-hard"] = {
-- 	base00 = "#1d2021"; base01 = "#3c3836"; base02 = "#504945"; base03 = "#665c54";
-- 	base04 = "#bdae93"; base05 = "#d5c4a1"; base06 = "#ebdbb2"; base07 = "#fbf1c7";
-- 	base08 = "#fb4934"; base09 = "#fe8019"; base0A = "#fabd2f"; base0B = "#b8bb26";
-- 	base0C = "#8ec07c"; base0D = "#83a598"; base0E = "#d3869b"; base0F = "#d65d0e";
-- }
-- themes["gruvbox-dark-medium"] = {
-- 	base00 = "#282828"; base01 = "#3c3836"; base02 = "#504945"; base03 = "#665c54";
-- 	base04 = "#bdae93"; base05 = "#d5c4a1"; base06 = "#ebdbb2"; base07 = "#fbf1c7";
-- 	base08 = "#fb4934"; base09 = "#fe8019"; base0A = "#fabd2f"; base0B = "#b8bb26";
-- 	base0C = "#8ec07c"; base0D = "#83a598"; base0E = "#d3869b"; base0F = "#d65d0e";
-- }
-- themes["gruvbox-dark-pale"] = {
-- 	base00 = "#262626"; base01 = "#3a3a3a"; base02 = "#4e4e4e"; base03 = "#8a8a8a";
-- 	base04 = "#949494"; base05 = "#dab997"; base06 = "#d5c4a1"; base07 = "#ebdbb2";
-- 	base08 = "#d75f5f"; base09 = "#ff8700"; base0A = "#ffaf00"; base0B = "#afaf00";
-- 	base0C = "#85ad85"; base0D = "#83adad"; base0E = "#d485ad"; base0F = "#d65d0e";
-- }
-- themes["harmonic-dark"] = {
-- 	base00 = "#0b1c2c"; base01 = "#223b54"; base02 = "#405c79"; base03 = "#627e99";
-- 	base04 = "#aabcce"; base05 = "#cbd6e2"; base06 = "#e5ebf1"; base07 = "#f7f9fb";
-- 	base08 = "#bf8b56"; base09 = "#bfbf56"; base0A = "#8bbf56"; base0B = "#56bf8b";
-- 	base0C = "#568bbf"; base0D = "#8b56bf"; base0E = "#bf568b"; base0F = "#bf5656";
-- }
-- themes["heetch"] = {
-- 	base00 = "#190134"; base01 = "#392551"; base02 = "#5A496E"; base03 = "#7B6D8B";
-- 	base04 = "#9C92A8"; base05 = "#BDB6C5"; base06 = "#DEDAE2"; base07 = "#FEFFFF";
-- 	base08 = "#27D9D5"; base09 = "#5BA2B6"; base0A = "#8F6C97"; base0B = "#C33678";
-- 	base0C = "#F80059"; base0D = "#BD0152"; base0E = "#82034C"; base0F = "#470546";
-- }
-- themes["hopscotch"] = {
-- 	base00 = "#322931"; base01 = "#433b42"; base02 = "#5c545b"; base03 = "#797379";
-- 	base04 = "#989498"; base05 = "#b9b5b8"; base06 = "#d5d3d5"; base07 = "#ffffff";
-- 	base08 = "#dd464c"; base09 = "#fd8b19"; base0A = "#fdcc59"; base0B = "#8fc13e";
-- 	base0C = "#149b93"; base0D = "#1290bf"; base0E = "#c85e7c"; base0F = "#b33508";
-- }
-- themes["horizon-dark"] = {
-- 	base00 = "#1C1E26"; base01 = "#232530"; base02 = "#2E303E"; base03 = "#676A8D";
-- 	base04 = "#CED1D0"; base05 = "#CBCED0"; base06 = "#DCDFE4"; base07 = "#E3E6EE";
-- 	base08 = "#E93C58"; base09 = "#E58D7D"; base0A = "#EFB993"; base0B = "#EFAF8E";
-- 	base0C = "#24A8B4"; base0D = "#DF5273"; base0E = "#B072D1"; base0F = "#E4A382";
-- }
-- themes["icy"] = {
-- 	base00 = "#021012"; base01 = "#031619"; base02 = "#041f23"; base03 = "#052e34";
-- 	base04 = "#064048"; base05 = "#095b67"; base06 = "#0c7c8c"; base07 = "#109cb0";
-- 	base08 = "#16c1d9"; base09 = "#b3ebf2"; base0A = "#80deea"; base0B = "#4dd0e1";
-- 	base0C = "#26c6da"; base0D = "#00bcd4"; base0E = "#00acc1"; base0F = "#0097a7";
-- }
-- themes["materia"] = {
-- 	base00 = "#263238"; base01 = "#2C393F"; base02 = "#37474F"; base03 = "#707880";
-- 	base04 = "#C9CCD3"; base05 = "#CDD3DE"; base06 = "#D5DBE5"; base07 = "#FFFFFF";
-- 	base08 = "#EC5F67"; base09 = "#EA9560"; base0A = "#FFCC00"; base0B = "#8BD649";
-- 	base0C = "#80CBC4"; base0D = "#89DDFF"; base0E = "#82AAFF"; base0F = "#EC5F67";
-- }
-- themes["material-darker"] = {
-- 	base00 = "#212121"; base01 = "#303030"; base02 = "#353535"; base03 = "#4A4A4A";
-- 	base04 = "#B2CCD6"; base05 = "#EEFFFF"; base06 = "#EEFFFF"; base07 = "#FFFFFF";
-- 	base08 = "#F07178"; base09 = "#F78C6C"; base0A = "#FFCB6B"; base0B = "#C3E88D";
-- 	base0C = "#89DDFF"; base0D = "#82AAFF"; base0E = "#C792EA"; base0F = "#FF5370";
-- }
-- themes["material-palenight"] = {
-- 	base00 = "#292D3E"; base01 = "#444267"; base02 = "#32374D"; base03 = "#676E95";
-- 	base04 = "#8796B0"; base05 = "#959DCB"; base06 = "#959DCB"; base07 = "#FFFFFF";
-- 	base08 = "#F07178"; base09 = "#F78C6C"; base0A = "#FFCB6B"; base0B = "#C3E88D";
-- 	base0C = "#89DDFF"; base0D = "#82AAFF"; base0E = "#C792EA"; base0F = "#FF5370";
-- }
-- themes["material-vivid"] = {
-- 	base00 = "#202124"; base01 = "#27292c"; base02 = "#323639"; base03 = "#44464d";
-- 	base04 = "#676c71"; base05 = "#80868b"; base06 = "#9e9e9e"; base07 = "#ffffff";
-- 	base08 = "#f44336"; base09 = "#ff9800"; base0A = "#ffeb3b"; base0B = "#00e676";
-- 	base0C = "#00bcd4"; base0D = "#2196f3"; base0E = "#673ab7"; base0F = "#8d6e63";
-- }
-- themes["material"] = {
-- 	base00 = "#263238"; base01 = "#2E3C43"; base02 = "#314549"; base03 = "#546E7A";
-- 	base04 = "#B2CCD6"; base05 = "#EEFFFF"; base06 = "#EEFFFF"; base07 = "#FFFFFF";
-- 	base08 = "#F07178"; base09 = "#F78C6C"; base0A = "#FFCB6B"; base0B = "#C3E88D";
-- 	base0C = "#89DDFF"; base0D = "#82AAFF"; base0E = "#C792EA"; base0F = "#FF5370";
-- }
-- themes["nord"] = {
-- 	base00 = "#2E3440"; base01 = "#3B4252"; base02 = "#434C5E"; base03 = "#4C566A";
-- 	base04 = "#D8DEE9"; base05 = "#E5E9F0"; base06 = "#ECEFF4"; base07 = "#8FBCBB";
-- 	base08 = "#88C0D0"; base09 = "#81A1C1"; base0A = "#5E81AC"; base0B = "#BF616A";
-- 	base0C = "#D08770"; base0D = "#EBCB8B"; base0E = "#A3BE8C"; base0F = "#B48EAD";
-- }
-- themes["ocean"] = {
-- 	base00 = "#2b303b"; base01 = "#343d46"; base02 = "#4f5b66"; base03 = "#65737e";
-- 	base04 = "#a7adba"; base05 = "#c0c5ce"; base06 = "#dfe1e8"; base07 = "#eff1f5";
-- 	base08 = "#bf616a"; base09 = "#d08770"; base0A = "#ebcb8b"; base0B = "#a3be8c";
-- 	base0C = "#96b5b4"; base0D = "#8fa1b3"; base0E = "#b48ead"; base0F = "#ab7967";
-- }
-- themes["oceanicnext"] = {
-- 	base00 = "#1B2B34"; base01 = "#343D46"; base02 = "#4F5B66"; base03 = "#65737E";
-- 	base04 = "#A7ADBA"; base05 = "#C0C5CE"; base06 = "#CDD3DE"; base07 = "#D8DEE9";
-- 	base08 = "#EC5f67"; base09 = "#F99157"; base0A = "#FAC863"; base0B = "#99C794";
-- 	base0C = "#5FB3B3"; base0D = "#6699CC"; base0E = "#C594C5"; base0F = "#AB7967";
-- }
-- themes["onedark"] = {
-- 	base00 = "#1e222a"; base01 = "#353b45"; base02 = "#3e4451"; base03 = "#545862";
-- 	base04 = "#565c64"; base05 = "#abb2bf"; base06 = "#b6bdca"; base07 = "#c8ccd4";
-- 	base08 = "#e06c75"; base09 = "#d19a66"; base0A = "#e5c07b"; base0B = "#98c379";
-- 	base0C = "#56b6c2"; base0D = "#61afef"; base0E = "#c678dd"; base0F = "#be5046";
-- }
-- themes["paraiso"] = {
-- 	base00 = "#2f1e2e"; base01 = "#41323f"; base02 = "#4f424c"; base03 = "#776e71";
-- 	base04 = "#8d8687"; base05 = "#a39e9b"; base06 = "#b9b6b0"; base07 = "#e7e9db";
-- 	base08 = "#ef6155"; base09 = "#f99b15"; base0A = "#fec418"; base0B = "#48b685";
-- 	base0C = "#5bc4bf"; base0D = "#06b6ef"; base0E = "#815ba4"; base0F = "#e96ba8";
-- }
-- themes["porple"] = {
-- 	base00 = "#292c36"; base01 = "#333344"; base02 = "#474160"; base03 = "#65568a";
-- 	base04 = "#b8b8b8"; base05 = "#d8d8d8"; base06 = "#e8e8e8"; base07 = "#f8f8f8";
-- 	base08 = "#f84547"; base09 = "#d28e5d"; base0A = "#efa16b"; base0B = "#95c76f";
-- 	base0C = "#64878f"; base0D = "#8485ce"; base0E = "#b74989"; base0F = "#986841";
-- }
-- themes["rebecca"] = {
-- 	base00 = "#292a44"; base01 = "#663399"; base02 = "#383a62"; base03 = "#666699";
-- 	base04 = "#a0a0c5"; base05 = "#f1eff8"; base06 = "#ccccff"; base07 = "#53495d";
-- 	base08 = "#a0a0c5"; base09 = "#efe4a1"; base0A = "#ae81ff"; base0B = "#6dfedf";
-- 	base0C = "#8eaee0"; base0D = "#2de0a7"; base0E = "#7aa5ff"; base0F = "#ff79c6";
-- }
-- themes["seti"] = {
-- 	base00 = "#151718"; base01 = "#282a2b"; base02 = "#3B758C"; base03 = "#41535B";
-- 	base04 = "#43a5d5"; base05 = "#d6d6d6"; base06 = "#eeeeee"; base07 = "#ffffff";
-- 	base08 = "#Cd3f45"; base09 = "#db7b55"; base0A = "#e6cd69"; base0B = "#9fca56";
-- 	base0C = "#55dbbe"; base0D = "#55b5db"; base0E = "#a074c4"; base0F = "#8a553f";
-- }
-- themes["snazzy"] = {
-- 	base00 = "#282a36"; base01 = "#34353e"; base02 = "#43454f"; base03 = "#78787e";
-- 	base04 = "#a5a5a9"; base05 = "#e2e4e5"; base06 = "#eff0eb"; base07 = "#f1f1f0";
-- 	base08 = "#ff5c57"; base09 = "#ff9f43"; base0A = "#f3f99d"; base0B = "#5af78e";
-- 	base0C = "#9aedfe"; base0D = "#57c7ff"; base0E = "#ff6ac1"; base0F = "#b2643c";
-- }
-- themes["solarflare"] = {
-- 	base00 = "#18262F"; base01 = "#222E38"; base02 = "#586875"; base03 = "#667581";
-- 	base04 = "#85939E"; base05 = "#A6AFB8"; base06 = "#E8E9ED"; base07 = "#F5F7FA";
-- 	base08 = "#EF5253"; base09 = "#E66B2B"; base0A = "#E4B51C"; base0B = "#7CC844";
-- 	base0C = "#52CBB0"; base0D = "#33B5E1"; base0E = "#A363D5"; base0F = "#D73C9A";
-- }
-- themes["zenburn"] = {
-- 	base00 = "#383838"; base01 = "#404040"; base02 = "#606060"; base03 = "#6f6f6f";
-- 	base04 = "#808080"; base05 = "#dcdccc"; base06 = "#c0c0c0"; base07 = "#ffffff";
-- 	base08 = "#dca3a3"; base09 = "#dfaf8f"; base0A = "#e0cf9f"; base0B = "#5f7f5f";
-- 	base0C = "#93e0e3"; base0D = "#7cb8bb"; base0E = "#dc8cc3"; base0F = "#000000";
-- }

-- local z = [[
--   "atelier-cave", "atelier-estuary", "atelier-forest", "atelier-heath",
--   "atelier-lakeside", "atelier-plateau", "atelier-savanna", "atelier-seaside",
--   "atelier-sulphurpool", "atlas", "black-metal-burzum", "black-metal-dark-funeral",
--   "bright", "brogrammer", "brushtrees-dark", "brushtrees", "chalk", "circus",
--   "classic-dark", "codeschool", "cupcake", "darktooth", "default-dark", "dracula",
--   "eighties", "flat", "google-dark", "gruvbox-dark-hard", "gruvbox-dark-medium",
--   "gruvbox-dark-pale", "harmonic-dark", "heetch", "hopscotch", "horizon-dark",
--   "icy", "materia", "material-darker", "material-palenight", "material-vivid",
--   "material", "nord", "ocean", "oceanicnext", "onedark", "paraiso", "porple",
--   "rebecca", "seti", "snazzy", "solarflare", "zenburn" ]]

-- Colors base00 to base07 are typically variations of a shade and run from darkest to lightest. These colors are used for foreground and background, status bars, line highlighting and such. Colors base08 to base0F are typically individual colors used for types, operators, names and variables. In order to create a dark theme, colors base00 to base07 should span from dark to light. For a light theme, these colours should span from light to dark.
--
-- local base16 = {
--   base00; base01; base02; base03;
--   base04; base05; base06; base07;
--   base08; base09; base0A; base0B;
--   base0C; base0D; base0E; base0F;
-- }
-- local base16 = {
--   "221b1c"; "574243"; "906f71"; "e54353";
--   "b575d7"; "d56167"; "e54353"; "fa9e4d";
--   "4999cf"; "d56167"; "b575d7"; "a264c0";
--   "ff1f35"; "44e778"; "ff983e"; "7045ef";
-- }

