<%@page import="model.Compte"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- ======= Connected User Ventes&Achats ======= -->
    <section id="services" class="services">
      <div class="container">

        <div class="section-title">
          <h2>Action rapide</h2>
        </div>
          
          <div class='row'>
          
          <% 
              
              

           Compte leComptePRO=(Compte)session.getAttribute("compte");
           
           if(leComptePRO.getLeRole().getNom().equals("Salarie") || leComptePRO.getLeRole().getNom().equals("Admin")){
              out.println("<div class='col-lg-4 col-md-6 d-flex align-items-stretch' data-aos='zoom-in' data-aos-delay='100'>"
                      + "<div class='icon-box iconbox-blue'>"
                      + " <div class='icon'>"
                      + " <svg width='100' height='100' viewBox='0 0 600 600' xmlns='http://www.w3.org/2000/svg'>"
                      + " <path stroke='none' stroke-width='0' fill='#f5f5f5' d='M300,521.0016835830174C376.1290562159157,517.8887921683347,466.0731472004068,529.7835943286574,510.70327084640275,468.03025145048787C554.3714126377745,407.6079735673963,508.03601936045806,328.9844924480964,491.2728898941984,256.3432110539036C474.5976632858925,184.082847569629,479.9380746630129,96.60480741107993,416.23090153303,58.64404602377083C348.86323505073057,18.502131276798302,261.93793281208167,40.57373210992963,193.5410806939664,78.93577620505333C130.42746243093433,114.334589627462,98.30271207620316,179.96522072025542,76.75703585869454,249.04625023123273C51.97151888228291,328.5150500222984,13.704378332031375,421.85034740162234,66.52175969318436,486.19268352777647C119.04800174914682,550.1803526380478,217.28368757567262,524.383925680826,300,521.0016835830174'></path>"
                      + "</svg>"
                      + "<i class='bx bx-user-plus'></i>"
                      + "</div>"
                      + "<h4><a href='../ServletCompte/ajouterCompteClient'>Ajouter un client</a></h4>"
                      + "<p>Ajouter un nouveau client identifi?? par un login et un mot de passe</p>"
                      + "</div>"
                      + "</div>");
            }
           

            if(leComptePRO.getLeRole().getNom().equals("Admin")){
              out.println("<div class='col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0' data-aos='zoom-in' data-aos-delay='100'>"
                      + "<div class='icon-box iconbox-orange'>"
                      + " <div class='icon'>"
                      + " <svg width='100' height='100' viewBox='0 0 600 600' xmlns='http://www.w3.org/2000/svg'>"
                      + " <path stroke='none' stroke-width='0' fill='#f5f5f5' d='M300,503.46388370962813C374.79870501325706,506.71871716319447,464.8034551963731,527.1746412648533,510.4981551193396,467.86667711651364C555.9287308511215,408.9015244558933,512.6030010748507,327.5744911775523,490.211057578863,256.5855673507754C471.097692560561,195.9906835881958,447.69079081568157,138.11976852964426,395.19560036434837,102.3242989838813C329.3053358748298,57.3949838291264,248.02791733380457,8.279543830951368,175.87071277845988,42.242879143198664C103.41431057327972,76.34704239035025,93.79494320519305,170.9812938413882,81.28167332365135,250.07896920659033C70.17666984294237,320.27484674793965,64.84698225790005,396.69656628748305,111.28512138212992,450.4950937839243C156.20124167950087,502.5303643271138,231.32542653798444,500.4755392045468,300,503.46388370962813'></path>"
                      + "</svg>"
                      + "<i class='bx bx-user-plus'></i>"
                      + "</div>"
                      + "<h4><a href='../ServletCompte/ajouterComptePro'>Ajouter un salari??</a></h4>"
                      + "<p>Ajouter un nouveau salari?? identifi?? par un login et un mot de passe</p>"
                      + "</div>"
                      + "</div>");
            }
            

            if(leComptePRO.getLeRole().getNom().equals("Salarie") || leComptePRO.getLeRole().getNom().equals("Admin")){
              out.println("<div class='col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0' data-aos='zoom-in' data-aos-delay='200'>"
                      + "<div class='icon-box iconbox-pink'>"
                      + " <div class='icon'>"
                      + " <svg width='100' height='100' viewBox='0 0 600 600' xmlns='http://www.w3.org/2000/svg'>"
                      + " <path stroke='none' stroke-width='0' fill='#f5f5f5' d='M300,582.0697525312426C382.5290701553225,586.8405444964366,449.9789794690241,525.3245884688669,502.5850820975895,461.55621195738473C556.606425686781,396.0723002908107,615.8543463187945,314.28637112970534,586.6730223649479,234.56875336149918C558.9533121215079,158.8439757836574,454.9685369536778,164.00468322053177,381.49747125262974,130.76875717737553C312.15926192815925,99.40240125094834,248.97055460311594,18.661163978235184,179.8680185752513,50.54337015887873C110.5421016452524,82.52863877960104,119.82277516462835,180.83849132639028,109.12597500060166,256.43424936330496C100.08760227029461,320.3096726198365,92.17705696193138,384.0621239912766,124.79988738764834,439.7174275375508C164.83382741302287,508.01625554203684,220.96474134820875,577.5009287672846,300,582.0697525312426'></path>"
                      + "</svg>"
                      + "<i class='bx bx-plus-circle'></i>"
                      + "</div>"
                      + "<h4><a href='../ServletVente/ajouterVente'>Ajouter une vente </a></h4>"
                      + "<p>Ajouter une nouvelle vente aux ench??res Equida. Vous pourrez y ajouter des chevaux ult??rieurement.</p>"
                      + "</div>"
                      + "</div>");
            }
            
            if(leComptePRO.getLeRole().getNom().equals("Salarie") || leComptePRO.getLeRole().getNom().equals("Admin")){
              out.println("<div class='col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0' data-aos='zoom-in' data-aos-delay='100'>"
                      + "<div class='icon-box iconbox-orange'>"
                      + " <div class='icon'>"
                      + " <svg width='100' height='100' viewBox='0 0 600 600' xmlns='http://www.w3.org/2000/svg'>"
                      + " <path stroke='none' stroke-width='0' fill='#f5f5f5' d='M300,503.46388370962813C374.79870501325706,506.71871716319447,464.8034551963731,527.1746412648533,510.4981551193396,467.86667711651364C555.9287308511215,408.9015244558933,512.6030010748507,327.5744911775523,490.211057578863,256.5855673507754C471.097692560561,195.9906835881958,447.69079081568157,138.11976852964426,395.19560036434837,102.3242989838813C329.3053358748298,57.3949838291264,248.02791733380457,8.279543830951368,175.87071277845988,42.242879143198664C103.41431057327972,76.34704239035025,93.79494320519305,170.9812938413882,81.28167332365135,250.07896920659033C70.17666984294237,320.27484674793965,64.84698225790005,396.69656628748305,111.28512138212992,450.4950937839243C156.20124167950087,502.5303643271138,231.32542653798444,500.4755392045468,300,503.46388370962813'></path>"
                      + "</svg>"
                      + "<i class='bx bxs-flag-checkered'></i>"
                      + "</div>"
                      + "<h4><a href='../ServletCourse/ajouterCourse'>Ajouter une course</a></h4>"
                      + "<p>Ajouter une nouvelle course, vous pourrez y renseigner des r??sultats dans une prochaine version de l'application</p>"
                      + "</div>"
                      + "</div>");
            }
           
          %>
              


         

        </div>

      </div>
    </section><!-- End Services Section -->