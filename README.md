# Passo a Passo

Instalar dependencias
```
flutter pub get
```
## Variaveis ambiente

Criar arquivo .env e alterar as variaveis ambientes conforme o exemplo no arquivo (.env.example)

## Iniciando APP

Iniciar aplicativo com null safety desativado! (Por conta de uma lib que estou utilizando)
```
flutter run --no-sound-null-safety
```

## Build APP

Buildar apk
```
flutter build apk --release --no-sound-null-safety
```
