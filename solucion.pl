%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Archivo para completar por el alumnos %%


%% alumno(+Nombre, +Correo, +Grado) is det.
%
%  Representa un alumno de la asignatura.
%
%  @param +Nombre: Nombre completo del alumno.
%  @param +Correo: Correo electrónico institucional.
%  @param +Grado:  Grado del alumno (Ciber | IA).

alumno('Leo Ibarra Marión', 'l.ibarra.2026@alumnos.urjc.es', 'Ciber').



%% Este ejercicio esta ya resuelto
proof(ejercicio01,
      [
          'Premisa'(1),
          'E' and b(1),
          'Premisa'(2),
          'Premisa'(3),
          'E' or (2, 3, 4),
          'E' and a(1),
          'I' and (6, 5)
      ]).

proof(ejercicio02,
      [
         'Premisa'(1),      %!p --> q and !q
         'I' ! (1),         %obtengo !!p por la contradiccion q and !q
         'E' ! (2)          %obtengo p
      ]).
      

proof(ejercicio03,
      [
         'Premisa'(1),      %p and q --> r
         'Premisa'(2),      % !r
         'MT'(1,2),         %Aplico Modus Tolens para obtener !(p and q)
         'De Morgan'(3)     %Aplico ley de Morgan para obtener !p or !q
      ]).

proof(ejercicio04,
      [
          'Premisa'(1),       % p or q
          'Premisa'(2),       % p --> r
          'Premisa'(3),       % q --> s
          'Premisa'(4),       % !r
          'MT'(2,4),          %por MT obtengo !p
          'Corte'(1,5),       %por corte obtengo q
          'E' --> (3,6)       % obtengo s eliminando --> de q --> s
      ]).
proof(ejercicio05,
      [
          'Premisa'(1),       % p --> q or r
          'Premisa'(2),       % !q
          'Premisa'(3),       % !r
          'Supuesto'(p),      % Suponego p para la contradiccion
          'E' --> (1,4),      % q or r
          'Corte'(5,2),       % Uso !q, para por Corte descartar q y obtener r
          'I' and (6,3),      % r contradice la premisa !r
          'I' --> (4,7),      % cierro supuesto p: p lleva a contradiccion
          'I' ! (8)           % Por introduccion de negacion obtengo !p
      ]).

proof(ejercicio06,
      [
          'Premisa'(1),           % p and q --> r
          'Supuesto'(p and !r),   % supongo el resultado esperado
          'E' and a(2),           % p / elimino el and para obtener p y !r
          'E' and b(2),           % !r
          'Supuesto'(q),          % Supongo q para demostrar que lleva a contradiccion
          'I' and (3,5),          % obtengo p and q para conseguir r
          'E' --> (1,6),          % r
          'I' and (7,4),          % r contradice !r
          'I' --> (5,8),          % obtengo que q lleva a contradiccion
          'I' ! (9),              % por introduccion de negacion obtengo !q
          'I' --> (2,10)          % cierro el supuesto inicial (p and !r --> !q)
      ]).

proof(ejercicio07,
      [
          'Premisa'(1),       % p or q
          'Premisa'(2),       % !p or r
          'Premisa'(3),       % !q or r
          'Supuesto'(p),      % de (!p or r) y p obtengo r, por lo que empiezo suponiendo p
          'Corte2'(2,4),      % aplico la regla de corte dos, la cual he definido para este ejercicio - obtengo r
          'I' --> (4,5),      % p --> r (ya tengo 1/2 para la eliminacion del or de la 1ª premisa)
          'Supuesto'(q),      % empiezo suponiendo q para obtener q --> r
          'Corte2'(3,7),      % aplico la regla de corte dos de nuevo para obtener r
          'I' --> (7,8),      % consigo q --> r
          'E' or (1,6,9)      % como tanto p como q implican r, de (p or q) obtengo r
      ]).

proof(ejercicio08,
      [
          'Supuesto'(!p or q),      % supongo el primer elemento del enunciado
          'Supuesto'(q --> r),      % supongo el segundo elemento
          'Supuesto'(p),            % supongo p para demostrar p --> r
          'Corte2'(1,3),            % por corte 2 obtengo q usando (!p or q) y p
          'E' --> (2,4),            % elimino q de (q --> r) para obtener r
          'I' --> (3,5),            % cierro el supuesto p mediante la introduccion de -->
          'I' --> (2,6),            % cierro el supuesto q --> r de la misma manera
          'I' --> (1,7)            % cierro el supuesto inicial para obtener el resultado
      ]).









%% Incluir reglas derivadas con el predicado rule/4    
%
% rule(+Nombre, +Premisas, +Consecuente, +Demostracion)


% Regla de De Morgan: !(A and B) |- !A or !B
rule('De Morgan',
     [!(A and B)],
     !A or !B,
     [
         'Premisa'(1),

        
         'Supuesto'(!(!A or !B)),  % Supongo la negacion de lo que quiero demostrar

         %Demuestro A
         'Supuesto'(!A),
         'I' or a(3,!B),           % !A or !B
         'I' and (4,2),            % contradiccion con !(!A or !B)
         'I' --> (3,5),
         'I' ! (6),                % !!A
         'E' ! (7),                % A

         %Demuestro B
         'Supuesto'(!B),
         'I' or b(!A,9),           % !A or !B
         'I' and (10,2),           % contradiccion con !(!A or !B)
         'I' --> (9,11),
         'I' ! (12),               % !!B
         'E' ! (13),               % B

         % A and B contradice la premisa !(A and B)
         'I' and (8,14),           % A and B
         'I' and (15,1),           % (A and B) and !(A and B)

         % eliminamos la doble negacion
         'I' --> (2,16),
         'I' ! (17),               % !!(!A or !B)
         'E' ! (18)                % !A or !B
     ]).

% Modus Tolens: de (A --> B and !B) obtenemos !A
rule('MT',
     [A --> B, !B],
     !A,
     [
         'Premisa'(1),        % A --> B
         'Premisa'(2),        % !B
         'Supuesto'(A),       % suponemos A
         'E' --> (1,3),       % obtenemos B
         'I' and (4,2),       % contradiccion B and !B
         'I' --> (3,5),       % A --> (B and !B)
         'I' ! (6)            % !A
     ]).


% Regla de Corte: de (A or B y !A) obtenemos B
rule('Corte',
     [A or B, !A],
     B,
     [
         'Premisa'(1),        % A or B
         'Premisa'(2),        % !A

         % Demostramos que si A, podemos llegar a B por contradiccion
         'Supuesto'(A),
         'Supuesto'(!B),
         'I' and (3,2),       % contradiccion A and !A
         'I' --> (4,5),       % !B contradiccion
         'I' ! (6),           % !!B
         'E' ! (7),           % B
         'I' --> (3,8),       % A --> B

         % Si ocurre B, tenemos B
         'Supuesto'(B),
         'I' --> (10,10),     % B --> B

         % En ambos casos de (A or B) obtenemos B, por lo que puedo eliminar el or
         'E' or (1,9,11)
     ]).

% regla de Corte dos: de (!A or B) y A, obtenemos B
rule('Corte2',
     [!A or B, A],
     B,
     [
         'Premisa'(1),        % !A or B
         'Premisa'(2),        % A

         % Si ocurre !A, contradice A y puedo obtener B
         'Supuesto'(!A),
         'Supuesto'(!B),
         'I' and (2,3),       % A and !A
         'I' --> (4,5),
         'I' ! (6),           % !!B
         'E' ! (7),           % B
         'I' --> (3,8),       % !A --> B

         % Si ocurre B, obtenemos B directamente
         'Supuesto'(B),
         'I' --> (10,10),     % B --> B

         % Elimino el or para obtener B
         'E' or (1,9,11)
     ]).
