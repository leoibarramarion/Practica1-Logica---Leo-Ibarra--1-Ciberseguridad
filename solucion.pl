%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Archivo para completar por el alumnos %%


%% alumno(+Nombre, +Correo, +Grado) is det.
%
%  Representa un alumno de la asignatura.
%
%  @param +Nombre: Nombre completo del alumno.
%  @param +Correo: Correo electrónico institucional.
%  @param +Grado:  Grado del alumno (Ciber | IA).

alumno('Leo Ibarra', 'l.ibarra.2026@alumnos.urjc.es', 'Ciber').



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


% Incluir el resto de demostraciones



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
