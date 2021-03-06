package com.xsis.batch137.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.document.AbstractPdfView;

import com.lowagie.text.Chunk;
import com.lowagie.text.Document;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfPage;
import com.lowagie.text.pdf.PdfWriter;
import com.xsis.batch137.model.PurchaseOrder;

public class PurchaseOrderPDFView extends AbstractPdfView {

	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document doc, PdfWriter writer, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
			List<PurchaseOrder> pos = (List<PurchaseOrder>) model.get("pos");
			doc.setPageSize(PageSize.A4.rotate());
		   	PdfPTable table = new PdfPTable(4);
			table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
			table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
			
			Font font = new Font(Font.BOLD, 16);
			Chunk title = new Chunk("Purchase Order", font);
			Paragraph judul = new Paragraph(title);
			judul.setAlignment(Element.ALIGN_CENTER);
			doc.add(judul);
			doc.add(new Paragraph(new Chunk("  ")));
			table.addCell("Created On");
			table.addCell("PO No");
			table.addCell("Notes");
			table.addCell("Status");

			for (PurchaseOrder po : pos) {
				table.addCell(String.valueOf(po.getCreatedOn()));
				table.addCell(po.getPoNo()); 
				table.addCell(po.getNotes()); 
				table.addCell(po.getStatus()); 
			}
			doc.add(table);
	}

}
