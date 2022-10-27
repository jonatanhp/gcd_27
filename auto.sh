echo iniciando script > /home/jonatan/jonatan/logs/mensaje.log
echo "iniciando script"
cd /home/jonatan/jonatan/prueba2gcd

git checkout main
git remote update

UPSTREAM=${1:-'@{u}'}
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse "$UPSTREAM")
BASE=$(git merge-base @ "$UPSTREAM")

if [ $LOCAL = $REMOTE ]; then
    echo "Up-to-date"
    echo "todo actualizado"
elif [ $LOCAL = $BASE ]; then
    echo "Need to pull"
    echo "iniciando pull"
    git reset --hard origin/main
    git pull origin main
    echo "luego del pull"
    #sh pull_code.sh     
fi
