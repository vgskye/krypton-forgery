# USAGE: bash build.sh <krypton jar> <out jar>
# You must have built a fabric 1.20.1 mod using fabric loom in this machine before.
# I realize that is an extremely strange prerequisite, but I do not care.

./gradlew build

java -jar ForgeryTools-0.2.0.jar \
    $1 \
    $2 \
    ~/.gradle/caches/fabric-loom/1.20.1/intermediary-v2.tiny \
    ~/.gradle/caches/forge_gradle/minecraft_repo/versions/1.20.1/mcp_mappings.tsrg \
    ./build/libs/forgery.jar \
    ~/.gradle/caches/fabric-loom/1.20.1/minecraft-merged-intermediary.jar \
    me.steinborn.krypton.mod.shared \
    ~/.gradle/caches/forge_gradle/minecraft_repo/versions/1.20.1/client_mappings.txt \
    ~/.gradle/caches/forge_gradle/minecraft_repo/versions/1.20.1/server_mappings.txt

# dollar store shadow
unzip $1 -d forgery-jij-temp
unzip forgery-jij-temp/META-INF/jars/velocity-*.jar -d forgery-jij-temp-natives
rm -r forgery-jij-temp-natives/META-INF forgery-jij-temp-natives/fabric.mod.json
cd forgery-jij-temp-natives
zip ../$2 $(find)
cd ..
rm -r forgery-jij-temp-natives forgery-jij-temp
