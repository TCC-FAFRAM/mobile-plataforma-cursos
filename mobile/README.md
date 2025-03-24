# FVM - Flutter Version Manager

O FVM (Flutter Version Manager) é uma ferramenta que permite gerenciar múltiplas versões do Flutter, facilitando o desenvolvimento em projetos que requerem versões específicas.

## Instalação

### 1. macOS/Linux
```bash
brew install fvm
```

### 2. Windows
**Com Scoop:**
```bash
scoop install fvm
```

**Com Chocolatey:**
```bash
choco install fvm
```

### 3. Via Dart CLI (alternativa para qualquer sistema operacional)
```bash
dart pub global activate fvm
```

## Comandos Básicos

### 1. Instalar uma versão específica do Flutter
```bash
fvm install <versão>
```
**Exemplo:**
```bash
fvm install 3.13.3
```

### 2. Usar uma versão no projeto
```bash
fvm use <versão>
```
**Exemplo:**
```bash
fvm use 3.13.3
```

### 3. Baixar a última versão estável
```bash
fvm install stable
fvm use stable
```

### 4. Definir uma versão global (opcional)
```bash
fvm global <versão>
```
**Exemplo:**
```bash
fvm global stable
```

### 5. Executar comandos do Flutter
Substitua `flutter` por `fvm flutter` para usar a versão gerenciada pelo FVM:
```bash
fvm flutter run
fvm flutter --version
```

### 6. Listar versões instaladas
```bash
fvm list
```

### 7. Remover uma versão
```bash
fvm remove <versão>
```

## Usar FVM no Projeto

Navegue até a pasta do projeto:
```bash
cd /caminho/do/projeto
```

Configure o FVM no projeto:
```bash
fvm use <versão>
```

Execute comandos no projeto com:
```bash
fvm flutter run
```

## Informações Adicionais

Ver todas as versões disponíveis para download:
```bash
fvm releases
```

Verificar o ambiente configurado:
```bash
fvm doctor
```
