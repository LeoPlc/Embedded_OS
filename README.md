# NOTES COURS CALCUL INTENSIF

## 1-INIT / CAST / REF

Types de données C++. Le compilateur permet d'inférer le type de données que le programmeur souhaite créer. Par exemple, si on a:  

```c++
    int x = 2;
    char y = 'e';

    x = x + y; // y est converti dans la donnée correspondante à x.
```

Dans ce cas, à la valeur de x sera ajoutée la valeur de y qui ici est sa valeur ASCII. Un éditeur de lien quant à lui permet la liaison de différents modules d'un progamme pour concevoir un fichier exécutable. Il permet de combiner les éléments compilés séparément en un ensemble. 

Lorsqu'on effectue un affichage, on peut utiliser `std::endl` ou `"\n"`. La différence entre ces deux notions est que pour `std::endl`, il s'agit d'un manipulateur de flux fourni par la bibliothèque standard C++. Il insère le caractère `"\n"` et en plus effectue une opération de vidage du tampon de flux associé. `std::endl` est souvent utilisé lorsque l'on veut forcer le vidage du tampon avant de lire une entrée utilisateur par exemple, pour garantir que toutes les sorties précédentes ont été affichées. Le caractère `"\n"` est un simple caractère mentionnant un retour à la ligne.

Quelques notions utiles ici pour gérer des déclarations:

- Déclaration d'un pointeur vers un caractère 

```c++
    char* ptrChar;
```

- Déclaration d'un vecteur de N entiers

```c++
    #include<vector>
    std::vector<int> vecteur(N); // Le 'int' permet de typer le vecteur
```

- Déclaration d'une référence vers un vecteur de N entiers

```c++
    #include<vector>
    std::vector<int> vecteur(N);
    std::vector<int>& refVecteur = vecteur;
```

- Déclaration d'un pointeur vers un vecteur de chaînes de caractères

```c++
    #include<vector>
    #include<string>
    std::vector<std::string>* ptrVersVecteurChar;
```

- Déclaration d'un pointeur de pointeur de caractères

```c++
    char** ptrDePtrChar;
```

- Déclaration d'un entier constant

```c++
    const int entierConstant = 42;
```

- Déclaration d'un pointeur vers un entier constant;

```c++
    const int* ptrEntierConstant;
```

- Déclaration d'un pointeur constant vers un entier

```c++
    int N = 10;
    int* const ptrCstInt = &N;
```

## 2-FONCTIONS (VECTORS)

On peut initialiser un `vector<int>` avec des valeurs particulières. Attention à la compilation, selon les versions de c++. Ici, penser à compiler en utilisant la commande suivante:

```
    g++ -std=c++11 -o main main.cpp
```
Et le code ci-dessous permet la génération d'un vecteur avec des valeurs, qu'on peut trier.

```c++

    #include <iostream>
    #include <vector>
    #include <algorithm>

    using namespace std;

    int main(){

    // Initialisation du vecteur 

        vector<int> monVecteur = {22,35,44,56,29};
        cout << 'avant le tri : ';

    // Affichage du vecteur avant le tri

        for(int value : monVecteur) {
            cout << value << " ";
        }

        cout << endl;

        sort(monVecteur.begin(),monVecteur.end());

    // Tri du vecteur dans l'ordre croissant

        cout << "Après le tri : ";
    
        for(int valeur : monVecteur) {
            cout << valeur << " ";
        }

        cout << endl;

        return 0;

    }

```

Il est possible aussi, si on veut, stocker des valeurs de type `char` dans un vecteur et de tout afficher dans des ordres différents.

```c++
    #include<iostream>
    #include<vector>
    #include<algorithm>

    using namespace std;

    int main(){
        vector<char> alphabet;

        for(char lettre = 'a'; lettre <= 'z'; ++ lettre){
            alphabet.push_back(lettre); // Ajoute la lettre spécifiée à la fin du vecteur alphabet
        }

        cout << "Ordre alphabétique : ";
        for(char lettre : alphabet){
            cout << lettre << " ";
        }
        cout << endl; 

        // Tri du vecteur dans l'ordre inverse

        reverse(alphabet.begin(), alphabet.end());

        cout << "Ordre inverse : ";
        for(char lettre : alphabet){
            cout << lettre << " ";
        }
        cout << endl; 

        return 0;

    }

``` 

À toujours compiler avec:

```
    g++ -std=c++11 -o main main.cpp
```



On peut aussi avoir affaire à des class (orienté objet), avec différentes fonctions comme ci-dessous.

```c++
    class String {
        public:
        String();
        ~String() {if (short_max < sz) delete[] ptr;}
        String & operator = (String&& x);
        String(const String&);
        String(String&& x);
        String& operator = (const String&);
    }
```

```c++
    String();
```

Il s'agit du constructeur par défaut, qui crée une instance de la classe `String` sans aucun argument. Il pourrait être utilisé pour créer une chaîne vide par défaut.

```c++
    ~String() {if (short_max < sz) delete[] ptr;}
```

Il s'agit ici du destructeur par défaut `~String()` qui libère la mémoire allouée dynamiquement via `delete[] ptr` si la taille de la chaîne dépasse une valeur prédéfinie par `short_max`.

```c++
    String & operator = (String&& x);
```

Il s'agit ici d'un opérateur d'assignation par déplacement, permettant d'assigner lecontenu d'une instance existante de `String` à une autre instance en utilisant le concept de déplacement.

```c++
    String(const String&);
```
Il s'agit ici du constructeur de copie, permettant de créer une nouvelle instance de `String()` en copiant les données depuis une autre instance existante. Cela assure une copie profonde des données.

```c++
    String(String&& x);
```

Il s'agit là non pas d'un opérateur de déplacement mais d'un **constructeur de déplacement**. Il permet de créer une nouvelle instance de `String()` en volant les ressources d'une autre instance, généralement utilisé pour optimiser les transferts de propriété lors des opérations de déplacement.

```c++
    String& operator = (String&& x);
```

C'est un opérateur d'assignation par déplacement, qui permet de tranférer efficacement les ressources d'une instance à une autre.

```c++
    String& operator = (const String&);
```

C'est un opérateur d'assignation par **copie**, qui copie donc les données d'une autre instance de `String()` tout en assurant une copie profonde des données.


En quelques mots, cette classe est une implémentation d'une classe de chaîne de caractères avec des optimisations pour chaînes courtes. Les opérations de déplacement sont fournies pour optimiser la gestion de la mémoire lors du transfert de propriété entre les instances. L'utilisation de l'allocation dynamique via `delete[] ptr` dans le destructeur infère une gestion de la mémoire dynamiquement pour stocker les chaînes de caractère.

On peut aussi se poser des questions sur la qualité d'un code fourni. Par exemple, voyons le code suivant:

```c++
    #include<stdio.h>

    int main(){

        int *ptr_one;
        ptr_one = (int *)malloc(sizeof(int));

        if(ptr_one == 0){
            printf("ERROR: out of memory\n");
            return 1;
        }

    *ptr_one = 25;

    printf("%d\n",*ptr_one);

    return 0;
    }
```

Dans ce code, un souci concerne l'allocation mémoire ave l'utilisation de `malloc`. En C++, il est généralement recommandé d'utiliser `new` et `delete` au lieu de `malloc` et `free` pour la gestion dynamique de la mémoire. Cela est dû au fait que `malloc` ne construit pas les objets alors que `new` appelle le constructeur approprié. Le code utilisant `new` peut se présenter comme suit:

```c++
    #include<iostream> // Utilisation de la bibliothèque pour cout plutôt que printf avec stdio.h

    using namespace std;

    int main(){

        int *ptr_one = new int;

        if(ptr_one == nullptr){
            cerr << "ERROR: out of memory\n";
            return 1;
        }

    *ptr_one = 25;

    cout << *ptr_one << endl;;
    delete ptr_one;

    return 0;
    }
```

Nous pouvons aussi avoir des classes à instancier de manière correcte. Par exemple ci-dessous différentes écritures, une d'entre-elles est correcte:

```c++
    class fipaSe = new monEtudiant();
    new monEtudiant = fipaSe();
    class monEtudiant = new fipaSe();
    fipaSe monEtudiant;
```

Dans notre cas, la manière correcte d'instancier la classe fipaSe, serait d'écrire

```c++
    fipaSe monEtudiant;
```

Nous avons ensuite une fonction de calcul de moyenne:

```c++
    #include<iostream>

    class MaClasseMath{
        public:
            static double moyenne(int a, int b){
                return a + b / 2;
            }
    }

    int main(){

        std::cout << MaClasseMath:moyenne(2,1) << std::endl;

    return 0;
    }
```

Dans un premier temps, le calcul de moyenne est mal écrit. À la place de `a + b / 2` il faudrait écrire, comme le calcul est un `double` qui plus est, `(a + b) / 2.0`. Le code devient

```c++
    #include<iostream>

    class MaClasseMath{
        public:
            static double moyenne(int a, int b){
                return (a + b) / 2.0;
            }
    }

    int main(){

        std::cout << MaClasseMath:moyenne(2,1) << std::endl;

    return 0;
    }
```

On pourrait maintenant se pencher sur de l'optimisation de code afin de le rendre plus performant, et moins sensible à la casse. Par exemple, partons du code suivant:

```c++
    #include<iostream>
    #include<vector>

    using namespace std;

    int main(){
        vector<int> myvector (10);
        for(unsigned i = 0; i < 10; ++i){
            myvector.at(i)=i;
        }
        for(unsigned i = 0; i < 10; ++i){
            cout << ' ' << myvector[i];
        }
        cout << '\n';
    return 0;
    }
```

Pour pouvoir l'optimiser, il faut se pencher sur les moindres améliorations à apporter. Dans un premier temps, dans la boucle `for`, il faudrait gérer les indices hors limite. Il faut s'assurer que `i` reste entre 0 et 9. Ici, si la taille du vecteur changeait, il faudrait changer `i` en conséquence. Il faut donc adapter `i` à la taille du vecteur via une nouvelle boucle `for` que l'on peut présenter comme telle:

```c++
    for(unsigned i = 0; i < myvector.size(); ++i);
```

Ensuite, on peut noter l'utilisation de `at`, précisément `myvector.at(i)` pour pouvoir accéder aux éléments du vecteur. C'est une bonne pratique pour s'assurer que `i` reste dans les limites du vecteur, sauf que comme on garantis ici que `i` le reste déjà via `for(unsigned i = 0; i < myvector.size(); ++i)`, ce n'est plus nécessaire. On peut donc corriger le code en écrivant plutôt

```c++
    myvector[i] = static_cast<int>(i); // static cast permet aussi la conversion si nécessaire
```

Ce qui nous fournit le code modifié ci-dessous:

```c++
    #include<iostream>
    #include<vector>

    using namespace std;

    int main(){
        vector<int> myvector (10);

        for(unsigned i = 0; myvector.size() < 10; ++i){
            myvector[i] = static_cast<int>(i);
        }
        for(unsigned i = 0; myvector.size(); ++i){
            cout << ' ' << myvector[i];
        }
        cout << '\n';
    return 0;
    }
```

On peut aller plus loin dans la conversion, notamment si nous souhaitions ajouter des variables `int` avec des variables `double`

Par exemple, si nous souhaitons ajouter 2 à une variable qui peut être de type `int` **ou** `double`, via des modèles, on peut écrire:

```c++
    #include<iostream>

    template<typename T>
    T ajouterDeux(T var){
        return var + 2;
    }

    int main(){

        // Exemple avec un entier

        int entier = 5;
        entier = ajouterDeux(entier);
        std::cout<< "Entier après ajout de 2 : " << entier << std::endl;

        // Exemple avec un double

        double reel = 3.14;
        reel = ajouterDeux(reel);

         std::cout<< "Double après ajout de 2 : " << reel << std::endl;


        return 0;
    }
```

Dans cet exemple, la fonction `ajouterDeux` est définie avec un `template` qui accepte n'importe quel type `template <typename T>`. 

Toujours dans le cadre des fonctions, on pourrait maintenant écrire ce qui s'appelle des lambda fonctions, par exemple pour savoir si un nombre est pair ou non. Ci-dessous la fonction concernée, premièrement sans capture et ensuite par capture par valeur.

- **Sans capture par valeur**

```c++
    #include <iostream>
    using namespace std;

    int main(){

        auto estPair = [](int nombre) {
            return nombre%2 == 0;
        }

        int nombre1 = 4;
        cout << nombre1 << "est" << (estPair(nombre1)? "pair":"impair") << endl;

        int nombre2 = 7;
        cout << nombre1 << "est" << (estPair(nombre2)? "pair":"impair") << endl;

        return 0;
    }

```

- **Avec capture par valeur**

```c++
    #include <iostream>
    using namespace std;

    int main(){

        int valeurCapturee = 3;

        auto estPair = [valeurCapturee](int nombre) {
            return (nombre+valeurCapturee)%2 == 0;
        }

        int nombre1 = 4;
        cout << nombre1 << "est" << (estPair(nombre1)? "pair":"impair") << endl;

        int nombre2 = 7;
        cout << nombre1 << "est" << (estPair(nombre2)? "pair":"impair") << endl;

        return 0;
    }

```

Nous avons des fonctions proposées ci-dessous, que nous shouaiterions utiliser afin de pouvoir par exemple calculer le minimum ainsi que le maximum d'un vecteur aléatoire. Les fonctions sont les suivantes:

```c++
    std::random_device seeder;
    std::mt19937 random_generator(seeder());
    double inf = 0.0;
    double sup = 100.0;
    std::uniform_real_distribution<> uniformDistribution(inf,sup);
    std::vector<double>v(1<<24);
    std::generate(v.begin(),v.end(),[&](){return uniformDistribution(random_generator);})

```

Le code est donc le suivant:

```c++
    #include <iostream>
    #include <vector>
    #include <algorithm>
    #include <random>

    using namespace std;

    int main(){

        // Initialisation du générateur de vecteurs aléatoires

        random_device seeder;
        mt19937 random_generator(seeder());

        double inf = 0.0;
        double sup = 100.0;
        uniform_real_distribution<> uniformDistribution(inf,sup);

        // Génération du vecteur aléatoire

        vector<double> v(1 << 24);
        generate(v.begin(),v.end(), [&](){return uniformDistribution(random_generator);})

        auto minElement = min_element(v.begin(), v.end());
        auto maxElement = max_element(v.begin(), v.end());

        cout << "Minimum du vecteur: " << *minElement << endl;
        cout << "Maximum du vecteur: " << *maxElement << endl;

        // Ecrêter le vecteur à la valeur de 50.0 à l'aide de std::transform


        transform(v.begin(),v.end(),v.begin(), [](double val){
            return min(max(val, 0.0), 50.0);
        })

    }

```

Dans ce code, `min_element` et `max_element` sont utilisés pour trouver les éléments minimum et maximum du vecteur aléatoire généré. Ensuite `transform` est utilisée pour ecrêter chaque élément du vecteur à la valeur 50.0 à l'aide de la fonction lambda fournie en argument. La fonction lambda utilise `min` et `max` pour s'assurer que chaque valeur est limitée entre 0 et 50.


On pourrait maintenant se poser la question: comment traiter les parties réelles et imaginaires d'un vecteur ? On peut faire en sorte de concevoir une fonction qui, par exemple, prend en entrée un vecteur de nombre complexes et retourne un vecteur contenant les parties réelles correspondantes. Le code se présente de la manière suivante:

```c++
    #include <iostream>
    #include <vector>
    #include <complex>

    using namespace std;


    // Fonction d'extraction des parties réelles de vecteurs complexes
    vector<double> partiesReelles(const vector<complex<doubkle>>&vecteurComplexe){
        vector<double> partiesReellesVecteur;

        for(const auto& nombreComplexe : vecteurComplexe) {
            partiesReellesVecteur.push_back(nombreComplexe.real());
        }

        return partiesReellesVecteur;
    }

    int main(){

        vector<complex<double>> vecteurComplexe = {{1.0, 2.0}, {3.0, 4.0}, {5.0, 6.0}};
        double partiesReellesVecteur = partiesReelles(vecteurComplexe);

        cout << "Parties réelles du vecteur complexe : ";
        for(const auto& partieReelle : partiesReellesVecteur) {
            cout << partieReelle << "  "; 
        }
        cout  << endl;
        return 0;
    }

```

Dans cet exemple, la fonction `partiesReelles` prend un vecteur de nombres complexes en entrée et utilise la fonction `real()` de la classe `complex` pour extraire la partie réelle de chaque nombre complexe. Les parties réelles sont ensuite stockées dans un nouveau vecteur qui est retourné.

On pourrait enfin écrire une classe `Cylindre` qui prend en paramètre le rayon et la hauteur, et qui a une fonction pour calculer le volume du cylindre en utilisant `std::numbers::pi`.


```c++
    #include <iostream>
    #include <cmath>
    #include <numbers>

    class Cylindre {
        public:
        // Constructeur
            Cylindre(double rayon, double hauteur): rayon_(rayon), hauteur_(hauteur) {}

        // Fonction pour calculer le volume du cylindre

            double calculerVolume() const {
                return std::numbers::pi * std::pow(rayon_,2) * hauteur;
            }

        private:
            double rayon_;
            double hauteur_;
    }

    int main(){

        double rayon = 3.0;
        double hauteur = 5.0;

        Cylindre cylindre(rayon,hauteur);

        double volume = cylindre.calculerVolume();

        // affichage du résultat

        std::cout<< "Le volume du cylindre est: " << volume  << std::endl;

        return 0;
    }

```

Dans cet exemple, la classe `Cylindre` a un constructeur qui prend le rayon et la hauteur en paramètres, et une fonction `calculerVolume` qui utilise la formule du volume d'un cylindre avec `std::numbers::pi`.