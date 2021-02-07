# flutter_app_miaged

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Installation
```bash
git clone https://github.com/ThomasGauci/appli_miaged.git
git checkout master
```
# RAPPORT 
## MVP : Interface de login 
- Critère d’acceptance #1 : Au lancement de l’application, une interface de login composée d’un headerBar
qui contient le nom de l’application, de deux champs et d’un bouton m’est proposée :heavy_check_mark:
- Critère d’acceptance #2 : Les deux champs de saisie sont : Login et Password :heavy_check_mark:
- Critère d’acceptance #3 : Le champ de saisie du password est obfusqué :heavy_check_mark:
- Critère d’acceptance #4 : Le label du bouton est : Se connecter :heavy_check_mark:
- Critère d’acceptance #5 : Au clic sur le bouton « Se connecter », une vérification en base est réalisée.
Si l’utilisateur existe, celui-ci est redirigé sur la page suivante. Si celui-ci n’existe pas, à minima un log
est affiché dans la console et l’application reste fonctionnelle :heavy_check_mark:
- Critère d’acceptance #6 : Au clic sur le bouton « Se connecter » avec les deux champs vides, l’application
doit rester fonctionnelle :heavy_check_mark:


## MVP : Liste de vêtements  
En tant qu’utilisateur connecté, je souhaite voir la liste des vêtements afin de choisir ceux qui
m’intéressent
- Critère d’acceptance #1 : Une fois connecté, l’utilisateur arrive sur cette page composée du contenu
principal et d’une BottomNavigationBar composée de trois entrées et leurs icones correspondantes :
Acheter, Panier et Profil :heavy_check_mark:
- - Critère d’acceptance #2 : La page actuelle est la page Acheter. Son icone et son texte sont d’une couleur
différente des autres entrées :heavy_check_mark:
- Critère d’acceptance #3 : Une liste déroulante de tous les vêtements m’est proposé à l’écran :heavy_check_mark:
- Critère d’acceptance #4 : Chaque vêtement affiche les informations suivantes :
  - Une image (ne pas gérer les images dans l’application, seulement insérer des liens vers des images d’internet) :heavy_check_mark:
  - Un titre :heavy_check_mark:
  - La taille :heavy_check_mark:
  - Le prix :heavy_check_mark:
- Critère d’acceptance #5 : Au clic sur une entrée de la liste, le détail est affiché (voir US#3) :heavy_check_mark:
- Critère d’acceptance #6 : Cette liste de vêtements est récupérée de la base de données :heavy_check_mark:

## MVP : Détail d’un vêtement  
En tant qu’utilisateur connecté, je souhaite voir le détail d’un vêtement afin de pouvoir vérifier s’il me
convient et l’ajouter dans mon panier
- Critère d’acceptance #1 : La page de détail est composée des informations suivantes :
  - Une image :heavy_check_mark:
  - Un titre :heavy_check_mark:
  - La taille :heavy_check_mark:
  - La marque :heavy_check_mark:
  - Le prix :heavy_check_mark:
- Critère d’acceptance #2 : La page est également composée d’un bouton « Retour » pour retourner à la
liste des vétements et d’un bouton « Ajouter au panier », ajoutant le vêtement dans le panier de
l’utilisateur (ajout en base) :heavy_check_mark:

## MVP : Le panier  
En tant qu’utilisateur connecté, je souhaite voir mon panier afin de le vérifier avant achat
- Critère d’acceptance #1 : Au clic sur le bouton « Panier », la liste des vêtements du panier de l’utilisateur
est affichée avec les informations suivantes :
  - Une image (ne pas gérer les images dans l’application, seulement insérer des liens vers des
images d’internet) :heavy_check_mark:
  - Un titre :heavy_check_mark:
  - La taille :heavy_check_mark:
  - Le prix :heavy_check_mark:
- Critère d’acceptance #2 : Un total général est affiché à l’utilisateur (somme de tous les vêtements du
panier) :heavy_check_mark:
- Critère d’acceptance #3 : A droite de chaque vetement, une croix permet à l’utilisateur de retirer un
produit. Au clic sur celle-ci, le produit est retiré de la liste et le total général mis à jour :heavy_check_mark:
- Critère d’acceptance #4 : Aucun autre bouton d’action n’est présent sur la page (pas de paiement pour
le moment) :heavy_check_mark:

## MVP : Profil utilisateur 
En tant qu’utilisateur connecté, je souhaite accéder aux informations de mon profil afin d’en vérifier
l’exactitude et de les modifier sur besoin
- Critère d’acceptance #1 : Au clic sur le bouton « Profil », les informations de l’utilisateur s’affichent
(récupérées en base de données) :heavy_check_mark:
- Critère d’acceptance #2 : Les informations sont :
  - Le login (readonly) :heavy_check_mark:
  - Le password (offusqué) :heavy_check_mark:
  - L’anniversaire :heavy_check_mark:
  - L’adresse :heavy_check_mark:
  - Le code postale (affiche le clavier numérique et n’accepte que les chiffres) :heavy_check_mark:
  - La ville :heavy_check_mark:
- Critère d’acceptance #3 : Un bouton « Valider » permet de sauvegarder les données (en base de
données) :heavy_check_mark:
- Critère d’acceptance #4 : Un bouton « Se déconnecter » permet de revenir à la page de login :heavy_check_mark:

## MVP : Filtrer sur la liste des vêtements
En tant qu’utilisateur connecté, je souhaite pouvoir filtrer la liste des vêtements pour afficher seulement
une catégorie
- Critère d’acceptance #1 : Sur la page « Acheter », une TabBar
(https://flutter.dev/docs/cookbook/design/tabs) est présente, listant les différentes catégories de
vêtements :x:
- Critère d’acceptance #2 : Par défaut, l’entrée « Tous » est sélectionnée et tous les vêtements sont
affichés :x:
- Critère d’acceptance #3 : Au clic sur une des entrées, la liste est filtrée pour afficher seulement les
vêtements correspondants à la catégorie sélectionnée :x:

## MVP : Ajout
- Ajout d'un chargement lors du chargement des données de la base de données
- Ajout d'une notification lors de la mise en panier d'un article

# Commentaire
Je n'ai pas fait la partie filtre tout simplement car je viens tout juste en écrivant ce readme de découvrir qu'elle existait.
Je n'ai pas non plus au beaucoup d'imagination quant à l'ajout de nouvelle fonctionnalité. 

# Utilisateur
- pseudo : test
- password : test

# Présentation 
## Login
![](https://lh3.googleusercontent.com/rpGwzTjHrFFjjbNoOml62aICvivf5gt9wbDQparTKFh_QwkwVfg71GX9jMvrb5zkTTU88XQ0sEVaNwqvPrYrxMtqJ7CRMt4WaWCmHVZc3RRUnXeun6KMoWsq5LmZSXnNIV6E90fSvJ6mb5iYIF_BTlP7sHI9MMf8tdwy6fdDWYlp4eD1jEsa5IyOLu1aal1DxdpeBsBgB8YnWgRhkeriU_F1OAo5PgUKK-AcPdemhJFbg2wy3CF9-HBlPyOtxOWSiysNvdMUSH8UNpTLqGNSRCMeSl6moJQ8kkmKIg8fqFyB6SvY_QYqljHMlg0IY_bp43-Cqyzacb3oClZ4mv7IW9NYdvt3ADxaDEKzKIX22QEnJLnIgwlXLxJ7qjHB_t-Ud-IY092PWl3guef8j2taRjNrPJ845wrBE_RR2re7WccQ0EGcc5sY2ezjyZAMZluZTY5A2BoJYZYjfTOJkOavA8Mcpk39xlmRKlwSIPrOggpcEeVq-uRSyL1X022T3wWSjCokEWln_xDt2-c1UurOEnsPZc2Wg6WwljwYSJdOhM6Ul4I0USgQYcL1RxIWHswD506QfOOEg4ZOs6RUe8X4F1JB0rwBJSCKZVQgmd9bV2Zv8gcr2-IAF4ARVIDmHoXntGLoxOYezYV6KDLZiE1LNNoDvvBcJx_72pBd6jWXFZZR9pYtoON4xfRNTAZGHg=w456-h937-no?authuser=0)

## Liste des vêtements
![](https://lh3.googleusercontent.com/qCBHYiVLGFPXXDUpVi06zLKu8rRTETNn5cP2OXC2j_lCZRDTUV2Qd52iepo4iDvc-rQ5pyFMLniG56wk0c4XDzJn3N1yftHg7yQhgIJM6vXoNDWzOLjCL2Y4dBe_wFt8elpbIVN2LVsiRtoWeXQUP30HA7i-KjkpM6SMY3kE3JV62Bpid9ascBXlsP6InV9qpJG6Hx2Yyexd7Q3kdvQSZBoHAPPvjJOpTmvFMZOva-OSQW5x6oRZs52Hq143C8I71ZQrrxg7LNRPy_0JNWJRw4sNgv8D6mHzMn7m4Lyq8sB-9FGqLmHOCOJPXYtnEQJ9HW4fpqgZhm6dA9JKD3HyH5PfpYl2hnseYuuBGM-0XBBcDmlmcoOXeQIc_qiVC1q8bfDzyUu3Yf4AmzHtniltfDb_c2uFWVZG-5dkAeCgGoZ4Bfqw8qd2pk68ZLXNEv1w-BH1h5Kx8vB0djbMpYa8YcKZ6IiyUQJRBhAVNpDib9NOYqKPxso-prkqR8MiMMHGpq1U0OQjqILIwHt9H7M0sw6QFYR1QD6n0TnYGMH45bieuKsH0xjiE6FJnCuBtoZWW2oskMYjqHJqAlJXPf8_b3WgZLXiZdY1XLCc4_0qloX52RFEKB_sgEEp32HJwPRjbXKnNpW-V5d2n-P1zIGsLrr1aXQZuzS6Y8hnts2ffRuR6O-A6APNaH92oYGYIA=w456-h937-no?authuser=0)

## Détail d'un vêtement
![](https://lh3.googleusercontent.com/Z4tdmQJZ8vEzjuSnQr8gE5wUuS5G4J5WEKhSeLrZakR--cjxrYk0Hm4ndOBFy3sIEe0q0kO1H4gXaw9jRDQn7vs9xg_ZXnSYJLHGwV2zRHJ_P5TvosiN7xs6oOplghq3FkkZtAld2IFVE_Gyl-b5wB-JHaa4O-k4Yjt5PlKL3ODnSB-ZAX_2s_opCur8GOvtKwFee0vtr3qXZYaiO18th0UZe_hfm6atWDP2CpikiUEmzQiut4KPWTT3zxyJrA6joYhLqfh7h2ydLmjoPtU8o8edPLdgHq0s7AFPHCViM2EuFyJ4PcQsi92TMxIew0ex5GUuCH5m8GnXTqsxjewv0uRTkoF2nQu5q7H37bm2UQcHomgVifGcx4N2bogHuqliEIrN7eyoogKd_YImpu0Vak_41EEQ7IjyaCSB_iYaLu6tQvkWc40a4j4P_vIQaeanYJL3wGw3MCYCC2gON-L9By1RCdbGHkkF3ITAiAff3HdVWZHSXy-cZYj-YzZOAflCZD4_IyHLsdcefhwCSlKtZlHjHpDpFIQT5JT4cddcYhVqkyXnbzCAk31VJcZTdUeZm38i6vuhw2vrbPdiXDuKG7PeZuDuGFnuJjTcuauBZzToXEaHbvSQgLHs0zHNjKg84q--86usIDg08dzpc6-KE5idyp6d8o2dEhI3XzdxHbt0W1FLN7SveTjrlgi4LA=w456-h937-no?authuser=0)

## Notification ajout d'un article dans le panier
![](https://lh3.googleusercontent.com/mNnP4icl93Zli6nBrSbESBxBOKoh3COT5E41-zabeuyUU8eAEWGTD6P4_u--x1OMknKi-qW3h0HyGnTw516yILJug1SWYpvzmqjQAjcSFkXaKyKqxiZKT0hCWU7KOCMbrdkXcB5Dq1zHxXPFV6jkARYU6xQxF3XQU_uWuBHLcj9CmBl03M13ZdeIZJZylwEPKB8dNGcp2u-fib4u5B7-6ZDESrNONcJiqFI7-aeBGD6mjgtIXx3zcpfaIS2vpcXQzgha_LICnWizGcGroA8ahq0qUlZsyCkQuo6khzn969j4gRaFapqbSlgMFtC9Yyob53rM2hDaBQI7wzOnDqT-ysbXhPSHS2PU2-faTG4j6tBoEEJqstUUnw2wBE2T0J4GXMoL_KSb3FXQOwUi7wptceZhGfibu9yse0ugfQ-mIxACMSvvhCyT0kPYusDQra_s2d2I0aGL6vZFGrXvnJUyP0v0MTZ5Fsb4i9D0dulFGw8ynmPAQRnx2oIqFOIZ-Atz4dVT9Rbffn2StYzXc0p9qImo2zxQ1CqxXzyhfAri2_GkC2wDNxKBkqK6A_Zdn5b8pa0vFPJTGKJmjSDeM4AjWVrL3eMxbgfCBeklkSRiGsFfZ7YFSYfVG7GrOSJ-aJXtODTFgyBnu1toCI7TBlL0URj5wlYAPL___3E7eSIVkHK6--5CpRis47V6_nP4yg=w456-h937-no?authuser=0)

## Panier
![](https://lh3.googleusercontent.com/Yk0SMM47dNCMWlSgIkcSEoogwGC-68yxglwJAQUJn7zQOEm42lSKVNfI-KAaVffA9ekc7UcnZbxrpgHcKF8jxMzUHIy-GGefV0cb7CcvklURI8eEaLIKUe0SRo4ZokjGYRKVTIbgQcwyk3pe9uYRQsBG996ueQLEjwS6V-DXoMr4rcWUEfl9lW3E05yuekeVit1M3H049jjb1u7jiFZpj1e7DZZdIUmZHP-BvmETet-SOMHrmH0NHUCZP9CFtzg1YZefF-H7hdbzTQ5w6bDMk_2wZNkKZJXdFVkuqSCpfGQ_eCHGNnNEVs7F8mqLkuVZfFl5sF57RcME5Uw9SSNBMg_yJfpiFs4StTdjWMCSwgjU0JmzCag4Nj30bK0UWd2cWqaBJebQeKIQXoKQwuBKXxo-AdWTe7gOzRyE4mHzzghz6QydhJcPu2N7a4vVXURzBGws21Nx_sLKtZVbd3WxFxmSCBJbxbY5Wd8sz5wL7ImDvDgl65Xa8PtM1p2Qn70_ej3nmY4H49x9LAEV1FUVYFKfteCWm4IFdgNr0ptZ7F0uL17eptlEJnCiHzf3DgY1mMOiJTsJm-hj2PXb5y94v9qH5p6JQznDoyrAppKrU1hQqmqotqgtlM499FHa0wNwcpy5vD6DWUXL3vfzCcWqPFWA-n_7LuuIP-RM2BmHtxfobrKonxoe9w7R0YeSTg=w456-h937-no?authuser=0)

## Chargement
![](https://lh3.googleusercontent.com/RpgvB9O2Fw3197DJbLTgbfaUd2VGHAzGbYzv7zbEXEKfFbP2k1DtAaI4FJaAh02tj9xwHl_A3i83vugCRrTAzwUqr_qorB0Cdl_W-HZZPS5V1uR-Q8qgbcYguNz8DU8YYfzhavIhW01QcZ-cR63cH-dhfgMZH1O05SUQr1QSqUR5OQr4N30495Deo63eQkgbaAtx3QMJgnmaOc9VurJ-pCpYHliTCLGgO-DNnE_ejxYeORgk3G6I7bI6ZHAcfBAkO949yInEOOoXcJy4qgxA9WlPktlKNn7KPuohXoNmIAted5fj0oBbu7tAZq7_S9TIYWy58Dqwuu4rx_RB4WUSW-zyi5Cm2aXhe8jE9iyPdqSE8LUSvV19xeF2nLXENzHLOYtTSmjU_7AF63-VV19f60NflFg3FCrgxAnO4k2j4V5kyAKrODL5Wydb8EZXflYY9dZamXs_0yra0TKZpak5N8SJw7mHnhgaCQ0DB4SZT3SuBaOl1QBQGgHugrkY34XD3snQV3Yvig_3MVsYdqyOlkitvHhB6ph-8_dktHs4PO60Tf8uiOPJMLGVwOinBRhjF_KyaOcExX6YDpbbOJfGuU-TCQA7tWl9NYGEk_pjmAb7koorKUT6oGb2Sl_Ba9mGqteZFNrbXIxnZr400oXjJoQUyZT7iiwKBT6s-tL5wY3CezJVAP2lG_cW_zbeuQ=w456-h937-no?authuser=0)

## Profil
![](https://lh3.googleusercontent.com/c3zbExO44e9qdxwjRgsTEMFjufE6KbbWxOGmA42ZeXezNi_Pfx2N0cNnKQLIOp5LhvqyBOQPqRMhU3D3l4aFkX6RwyL2Gxh_oO935DSP5vMOj2q9eXJ-7Khu-0QkzeuLOKHX8NIksqBkMOW6iANZddxq9iG5tQ21DksqyEQtcqjsAUPBFKRDQuYX3c-KAH9gArWODU0w5izEnnb04uHYOAlmllOE21o2NFw5mDwNSk8IuxGpMPclL3ncZZj-f27aC1ASkE9AQ586zlM_J6MlMhOovufdanMoTiWIFCI5u1MIyNgJ1CBz_37ZUWQSzb6ytSWLLFPTRlHfJFRHifAtxiU2-o73XCyZiQGD1kO6c3duzG-pZd_K-LrYsduYl6xvINois1UMu-Fn42inE2sQyIcmRReRmieO-LsshMD7VGYWBSp4BTXdYv4cWVZykAyqumiB0y1vryBGhrQ-tltvJPFmrSoKH1i4p0UrImrHShV1H91q7hSdYT37JHCD4EonbzW74Z-POoXKIt_uCBz5CiAS__s8YFbJvDB78FsNCsJjh2rYjgoqX8cl_gX2XozTKi6qKAbA0iBGBr4XE3vgE-r18yOQljSx-J8_smtDyozdkE5WTCFqugOxO0L1IJ4tuP1lQpE__P_8djqOFvXtGzJmGIKFoYoXhyauOeHescqFcqQyMHAiBhq5nFohYg=w456-h937-no?authuser=0)

## Editer un profil
![](https://lh3.googleusercontent.com/WikGeWz2lEvdbZRztaD09jenXvSxRav6H260EMFipBzSfyEHHZK9mJMc80J1j4qzF30JQJCIBIbzPaWRtv9iq6o9OtXg9PFppsuHxnVJMUR8xFH09UEBBAwl4ePDE--2EYSYjKVWkqE_7eltTCucc1Tk7lO8Pokh51I7QRGXBXXPxzir9nukimDhcejZlOOE2KqBPdDIPVPqjMvxQnRv39ucwYVKEjMU19oSDksGQiqiR1l8d_unbr6qpAD806iY4_iDQkT7S8B-3773js5J8OpbOvlbzgytq8eRzyE7CmcU5BEdqUQJ0WkwzSD2rDQzipi6eXpJ2IVG-SjE6vbrIohkqypktwCqBTit340q0E5Y0dZmuX15MqjJcw8uEe1Zfx2h2iKZvnpya1MDTYMK9O-hxyZM2P--2ifwEhxGeLxo6KaV64f23pOtcldJZW2mvMsJtWC9mhZPMHWmV8Hzb-8Jzay5it4pm6pHB3vHiW8tqSwnNbRCIYj0N62tar9pzAtI4ZwLKN-q4bOG22ZdbdO35UjqrxqyV1k0GAxXfMrzbChYWDkauZQubDecZUCYiqHihJIF00l_4urInvTxc5v4Ii0HNFo1YfEsEB2K8pV0ygMdAiTqqE41gUQn1lg78PezgU8v2HJx2577JuyXVcN6STAgDV7g_Sr1OKIXXPuXzHcuBeXygQSb5RAKUw=w456-h937-no?authuser=0)
