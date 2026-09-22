# PulseDeck para Windows

Um painel de diagnóstico com visual moderno, criado inteiramente em PowerShell + WPF. Ele transforma informações do computador em uma experiência visual impactante, sem exigir instalação de dependências.

## Como executar

1. Use **Windows 10 ou Windows 11**.
2. Clique duas vezes em `Iniciar-PulseDeck.bat`.
3. Se o Windows exibir um aviso do SmartScreen, escolha **Mais informações** e confirme somente se você confia nos arquivos deste repositório.

Também é possível iniciar pelo terminal:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\PulseDeck.ps1
```

## O que ele faz

- Exibe uso de CPU, memória e disco em tempo real.
- Mostra nome do computador, sistema, processador, tempo ligado e endereço IPv4.
- Apresenta uma lista dos processos que mais usam memória.
- Atualiza os dados automaticamente a cada dois segundos.
- Exporta um relatório de diagnóstico para a área de trabalho.
- Usa somente APIs nativas do Windows; nenhum dado é enviado pela internet.

## Observações

O aplicativo foi pensado como uma demonstração visual e segura. Algumas informações podem variar conforme permissões e versão do Windows. O script não altera configurações do computador.
