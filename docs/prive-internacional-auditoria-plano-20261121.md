# Privé Rencontre Internacional — Auditoria e plano (21/11/2026)

## Escopo e proteção
Branch de trabalho: `feat/prive-internacional-20261121`. Não realizar merge, deploy, alteração de produção ou pagamentos reais sem aprovação posterior.

## Evidências verificadas
- Repositório público `lucianodeev/prive-rencontre`, branch principal `main`.
- README: "MVP mobile-first 18+ para Europa e Brasil. Perfis atuais são somente demonstrações."
- Commit mais recente identificado: `d241c088899451f5de6d0e49e21c57660d1f0d6c` (26/09/2026), referente à confirmação de registo e conclusão de perfil.
- Commits anteriores mencionam integração de checkout/portal de faturação e estado de assinaturas.
- `package.json` na raiz não encontrado; stack, testes e integrações **ainda não verificados**.

## Auditoria técnica pendente
1. Inventariar árvore de ficheiros, stack, rotas, dependências e workflows CI.
2. Inspecionar autenticação, sessões, recuperação de conta, permissões e proteção contra abuso.
3. Validar cadastro de anunciantes, moderação, armazenamento de imagens, consentimento e propriedade das fotos.
4. Examinar modelos de dados, políticas de acesso e proteção de dados pessoais.
5. Verificar pesquisa por país/cidade, idiomas e responsividade.
6. Revisar pagamentos existentes sem ativar transações: confirmar que provedores aceitam o modelo de negócio.
7. Rodar lint, build, testes e auditoria de dependências no ambiente de teste; documentar resultados reais.

## Proposta de arquitetura funcional
- Diretório de perfis adultos com categorias inclusivas e filtros de localização/idioma.
- Conta de anunciante com gestão de fotos, apresentação, visibilidade e disponibilidade.
- Verificação privada de idade/identidade e consentimento para publicação.
- Moderação pré-publicação, denúncias, suspensão, bloqueios e trilha de auditoria.
- Conteúdo demonstrativo claramente identificado; nunca representar pessoas fictícias como profissionais reais.
- Localização PT-BR, PT-PT, FR, EN e ES com textos legais por jurisdição.
- Página de privacidade, termos, política de conteúdo, exclusão de conta e retenção mínima de dados.

## Condições para expansão
- Análise jurídica específica por país e cidade sobre publicidade/intermediação de serviços adultos, consentimento, proteção de menores e obrigações fiscais.
- Evitar facilitar exploração, coerção, tráfico ou anúncios de menores.
- Confirmar política dos fornecedores de pagamentos e hospedagem antes de integrar planos pagos.
- Fazer lançamento piloto apenas após testes, revisão de segurança e aprovação explícita.

## Ordem de implementação sugerida
Fase 1: inventário e testes do existente.
Fase 2: modelo de perfis e pesquisa internacional.
Fase 3: painel de anunciante, verificação e moderação.
Fase 4: idiomas, acessibilidade, SEO e privacidade.
Fase 5: validação legal/comercial por mercado e eventual piloto.

## Estado
Documento de preparação, não prova de conclusão da auditoria técnica nem de implementação funcional.
